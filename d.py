import os
import re
import sys
import subprocess
import requests
from dotenv import load_dotenv
import json
import yaml
from pathlib import Path

# Try to import UI enhancement libraries
try:
    from colorama import init, Fore, Back, Style
    init(autoreset=True)
    COLORAMA_AVAILABLE = True
except ImportError:
    COLORAMA_AVAILABLE = False
    print("⚠️  Colorama not available. Install with: pip install colorama")

try:
    from tqdm import tqdm
    TQDM_AVAILABLE = True
except ImportError:
    TQDM_AVAILABLE = False
    print("⚠️  tqdm not available. Install with: pip install tqdm")

# Load environment variables
load_dotenv()
API_KEY = os.getenv("DEEPSEEK_API_KEY")
if not API_KEY:
    print("❌ Error: DEEPSEEK_API_KEY not found in .env file")
    sys.exit(1)

DEEPSEEK_URL = "https://api.deepseek.com/v1/chat/completions"

SYSTEM_PROMPT = """
You are a coding assistant with full autonomy to:
- Write, improve, and debug code
- Reason step-by-step before giving answers
- Output commands to run when necessary
- Be concise, technical, and explicit

IMPORTANT SAFETY RULES:
1. When suggesting commands, ALWAYS explain what they do first
2. Format commands exactly as: #RUN: <command>
3. Only suggest safe, non-destructive commands
4. Never suggest commands that could damage systems or delete files without warning

Always think step-by-step and provide clear reasoning.
"""

class ConfigManager:
    """Configuration manager for user preferences"""
    
    def __init__(self):
        self.config_dir = Path.home() / ".deepseek_agent"
        self.config_file = self.config_dir / "config.yaml"
        self.default_config = {
            'ui': {
                'theme': 'default',
                'colors': True,
                'progress_bars': True,
                'confirm_commands': True
            },
            'behavior': {
                'timeout': 300,
                'max_retries': 3,
                'auto_clear_history': False
            },
            'paths': {
                'default_workspace': str(Path.cwd())
            }
        }
        self.config = self.default_config.copy()
        self.load_config()
    
    def load_config(self):
        """Load configuration from file"""
        try:
            if self.config_file.exists():
                with open(self.config_file, 'r') as f:
                    loaded_config = yaml.safe_load(f) or {}
                    # Deep merge with defaults
                    self._deep_merge(self.config, loaded_config)
                self._print_colored("✅ Configuration loaded", Fore.GREEN)
            else:
                self._create_default_config()
        except Exception as e:
            self._print_colored(f"⚠️  Config load error: {e}", Fore.YELLOW)
    
    def save_config(self):
        """Save configuration to file"""
        try:
            self.config_dir.mkdir(exist_ok=True)
            with open(self.config_file, 'w') as f:
                yaml.dump(self.config, f, default_flow_style=False)
            self._print_colored("✅ Configuration saved", Fore.GREEN)
        except Exception as e:
            self._print_colored(f"❌ Config save error: {e}", Fore.RED)
    
    def _deep_merge(self, target, source):
        """Deep merge two dictionaries"""
        for key, value in source.items():
            if isinstance(value, dict) and key in target and isinstance(target[key], dict):
                self._deep_merge(target[key], value)
            else:
                target[key] = value
    
    def _create_default_config(self):
        """Create default configuration file"""
        self.save_config()
        self._print_colored("📁 Created default config file", Fore.BLUE)
    
    def get(self, key_path, default=None):
        """Get configuration value by dot notation path"""
        keys = key_path.split('.')
        value = self.config
        try:
            for key in keys:
                value = value[key]
            return value
        except (KeyError, TypeError):
            return default
    
    def set(self, key_path, value):
        """Set configuration value by dot notation path"""
        keys = key_path.split('.')
        config = self.config
        for key in keys[:-1]:
            if key not in config:
                config[key] = {}
            config = config[key]
        config[keys[-1]] = value
        self.save_config()
    
    def _print_colored(self, message, color):
        """Print colored message if available"""
        if COLORAMA_AVAILABLE:
            print(color + message)
        else:
            print(message)

class DeepSeekAgent:
    def __init__(self):
        self.config = ConfigManager()
        self.conversation_history = [
            {"role": "system", "content": SYSTEM_PROMPT},
            {"role": "user", "content": "You are now my terminal coding agent. Acknowledge readiness and confirm you understand the safety rules."}
        ]
        self.session_active = True
        self.command_history = []

    def _print_colored(self, message, color=Fore.WHITE, style=Style.NORMAL):
        """Print colored message"""
        if COLORAMA_AVAILABLE and self.config.get('ui.colors', True):
            print(style + color + message)
        else:
            print(message)

    def _print_success(self, message):
        """Print success message"""
        self._print_colored(f"✅ {message}", Fore.GREEN)

    def _print_warning(self, message):
        """Print warning message"""
        self._print_colored(f"⚠️  {message}", Fore.YELLOW)

    def _print_error(self, message):
        """Print error message"""
        self._print_colored(f"❌ {message}", Fore.RED)

    def _print_info(self, message):
        """Print info message"""
        self._print_colored(f"💡 {message}", Fore.BLUE)

    def _print_system(self, message):
        """Print system message"""
        self._print_colored(f"🤖 {message}", Fore.CYAN)

    def _show_progress(self, message):
        """Show progress indicator"""
        if TQDM_AVAILABLE and self.config.get('ui.progress_bars', True):
            return tqdm(desc=message, bar_format='{desc}: {bar} | {elapsed}')
        else:
            self._print_info(message)
            return None

    def _validate_input(self, prompt, validation_func=None, error_message="Invalid input"):
        """Get and validate user input"""
        while True:
            try:
                user_input = input(prompt).strip()
                if not user_input:
                    self._print_warning("Input cannot be empty")
                    continue
                
                if validation_func and not validation_func(user_input):
                    self._print_error(error_message)
                    continue
                
                return user_input
            except KeyboardInterrupt:
                self._print_warning("\nInput cancelled")
                return None
            except EOFError:
                self._print_warning("\nEnd of input")
                return None

    def call_deepseek_api(self, messages, max_retries=None):
        """Make API call with proper error handling and retries"""
        if max_retries is None:
            max_retries = self.config.get('behavior.max_retries', 3)

        payload = {
            "model": "deepseek-chat",
            "messages": messages,
            "temperature": 0.7,
            "max_tokens": 2000,
            "stream": False
        }

        headers = {
            "Authorization": f"Bearer {API_KEY}",
            "Content-Type": "application/json"
        }

        progress_bar = self._show_progress("Calling DeepSeek API")
        
        for attempt in range(max_retries):
            try:
                response = requests.post(
                    DEEPSEEK_URL, 
                    json=payload, 
                    headers=headers, 
                    timeout=60
                )
                
                if progress_bar:
                    progress_bar.close()
                
                if response.status_code == 200:
                    self._print_success("API call successful")
                    return response.json()["choices"][0]["message"]["content"]
                else:
                    self._print_warning(f"API Error (attempt {attempt + 1}/{max_retries}): {response.status_code}")
                    if attempt == max_retries - 1:
                        self._print_error(f"Final failure: {response.text}")
                        return None
            except requests.exceptions.Timeout:
                self._print_warning(f"Timeout (attempt {attempt + 1}/{max_retries})")
            except requests.exceptions.RequestException as e:
                self._print_warning(f"Network error (attempt {attempt + 1}/{max_retries}): {e}")

        if progress_bar:
            progress_bar.close()
        return None

    def extract_commands(self, text):
        """Extract commands safely from response text"""
        commands = []
        lines = text.split('\n')
        
        for line in lines:
            clean_line = line.strip()
            if clean_line.startswith('#RUN:'):
                command = clean_line[5:].strip()  # Remove '#RUN:' prefix
                if command:  # Only add non-empty commands
                    commands.append(command)
        
        return commands

    def execute_command(self, command):
        """Execute a single command with safety checks"""
        self.command_history.append(command)
        self._print_system(f"Proposed command: {command}")
        
        # Safety checks - expand this list as needed
        dangerous_patterns = [
            r'rm\s+-rf', r'rm\s+-\*', r'mkfs', r'dd\s+if=.*of=/dev/',
            r'>\s+/dev/sd', r'format\s+', r'fdisk\s+/dev/', r'chmod\s+[0-7]{3,4}\s+',
            r'curl.*\|s*h', r'wget.*\|s*h'
        ]
        
        for pattern in dangerous_patterns:
            if re.search(pattern, command, re.IGNORECASE):
                self._print_error(f"SAFETY BLOCKED: This command matches dangerous pattern: {pattern}")
                return False
        
        # Ask for confirmation if enabled
        if self.config.get('ui.confirm_commands', True):
            try:
                confirm = self._validate_input(
                    "🔒 Execute this command? [y/N]: ",
                    lambda x: x.lower() in ['y', 'yes', 'n', 'no', ''],
                    "Please enter y/yes or n/no"
                )
                
                if confirm is None or confirm.lower() not in ['y', 'yes']:
                    self._print_warning("Command execution cancelled.")
                    return False
            except (KeyboardInterrupt, EOFError):
                self._print_warning("Command confirmation interrupted.")
                return False
        
        # Execute command
        try:
            self._print_system(f"Executing: {command}")
            print("="*50)
            
            timeout = self.config.get('behavior.timeout', 300)
            result = subprocess.run(
                command, 
                shell=True, 
                capture_output=True, 
                text=True,
                timeout=timeout
            )
            
            if result.stdout:
                self._print_colored("STDOUT:", Fore.GREEN)
                print(result.stdout)
            if result.stderr:
                self._print_colored("STDERR:", Fore.RED)
                print(result.stderr)
            
            self._print_colored(f"Return code: {result.returncode}", 
                              Fore.GREEN if result.returncode == 0 else Fore.RED)
            print("="*50)
            
            if result.returncode == 0:
                self._print_success("Command executed successfully")
            else:
                self._print_warning("Command completed with non-zero exit code")
            
            return True
            
        except subprocess.TimeoutExpired:
            self._print_error(f"Command timed out after {timeout} seconds")
            return False
        except Exception as e:
            self._print_error(f"Error executing command: {e}")
            return False

    def process_response(self, response):
        """Process API response and handle commands"""
        if not response:
            return
        
        self._print_system("DeepSeek Response:")
        print("-" * 40)
        print(response)
        print("-" * 40)
        
        # Extract and execute commands
        commands = self.extract_commands(response)
        if commands:
            self._print_info(f"Found {len(commands)} command(s) to execute")
            for i, command in enumerate(commands, 1):
                self._print_info(f"Command {i}/{len(commands)}")
                self.execute_command(command)
        else:
            self._print_info("No commands found in response")

    def handle_user_input(self, user_input):
        """Process user input and get response"""
        if not user_input.strip():
            self._print_warning("Empty input ignored")
            return
            
        self.conversation_history.append({"role": "user", "content": user_input})
        
        self._print_info("Thinking...")
        response = self.call_deepseek_api(self.conversation_history)
        
        if response:
            self.conversation_history.append({"role": "assistant", "content": response})
            self.process_response(response)
        else:
            self._print_error("Failed to get response from DeepSeek API")

    def show_config(self):
        """Show current configuration"""
        self._print_system("Current Configuration:")
        print(json.dumps(self.config.config, indent=2, default=str))

    def update_config(self):
        """Update configuration interactively"""
        self._print_system("Configuration Editor")
        
        settings = {
            '1': ('ui.colors', 'Enable colored output', bool),
            '2': ('ui.progress_bars', 'Enable progress bars', bool),
            '3': ('ui.confirm_commands', 'Confirm before executing commands', bool),
            '4': ('behavior.timeout', 'Command timeout (seconds)', int),
            '5': ('behavior.max_retries', 'API max retries', int)
        }
        
        while True:
            print("\nAvailable settings:")
            for key, (path, desc, type_) in settings.items():
                current = self.config.get(path)
                print(f"  {key}. {desc} (current: {current})")
            print("  b. Back to main menu")
            
            choice = self._validate_input(
                "\nSelect setting to modify: ",
                lambda x: x in list(settings.keys()) + ['b', 'B'],
                "Invalid choice"
            )
            
            if choice in ['b', 'B']:
                break
            
            path, desc, type_ = settings[choice]
            current = self.config.get(path)
            
            if type_ == bool:
                new_value = self._validate_input(
                    f"Enable {desc}? [y/N]: ",
                    lambda x: x.lower() in ['y', 'yes', 'n', 'no', ''],
                    "Please enter y/yes or n/no"
                )
                new_value = new_value.lower() in ['y', 'yes'] if new_value else False
            elif type_ == int:
                new_value = self._validate_input(
                    f"Enter new value for {desc}: ",
                    lambda x: x.isdigit() and int(x) > 0,
                    "Please enter a positive integer"
                )
                new_value = int(new_value) if new_value else current
            
            if new_value is not None:
                self.config.set(path, new_value)
                self._print_success(f"Updated {desc} to {new_value}")

    def show_help(self):
        """Show enhanced help information"""
        help_text = f"""
🤖 DeepSeek Coding Agent - Enhanced UI/UX

{Fore.CYAN}Basic Commands:{Style.RESET_ALL}
  'exit', 'quit', 'bye' - Exit the agent
  'clear' - Clear conversation history  
  'help' - Show this help message
  'config' - Show current configuration
  'settings' - Modify configuration interactively
  'history' - Show command history

{Fore.CYAN}Enhanced Features:{Style.RESET_ALL}
  • {Fore.GREEN}Colored output{Style.RESET_ALL} for better readability
  • {Fore.GREEN}Progress indicators{Style.RESET_ALL} for long operations
  • {Fore.GREEN}Input validation{Style.RESET_ALL} with clear error messages
  • {Fore.GREEN}Configuration system{Style.RESET_ALL} for personalization
  • {Fore.GREEN}Enhanced safety{Style.RESET_ALL} with command confirmation

{Fore.CYAN}Command Format:{Style.RESET_ALL}
  The agent will suggest commands prefixed with #RUN:
  You must confirm each command before execution (unless disabled in settings).

{Fore.CYAN}Safety Features:{Style.RESET_ALL}
  • Dangerous command patterns are automatically blocked
  • Command confirmation required by default
  • 5-minute command timeout (configurable)
  • API error retry mechanism

{Fore.YELLOW}Dependencies:{Style.RESET_ALL}
  • colorama: Colored terminal output ({'✅ Available' if COLORAMA_AVAILABLE else '❌ Not available'})
  • tqdm: Progress bars ({'✅ Available' if TQDM_AVAILABLE else '❌ Not available'})
  • pyyaml: Configuration files ({'✅ Available' if 'yaml' in sys.modules else '❌ Not available'})

Run 'settings' to customize behavior and appearance.
"""
        print(help_text)

    def show_command_history(self):
        """Show command execution history"""
        if not self.command_history:
            self._print_info("No commands in history")
            return
        
        self._print_system("Command History:")
        for i, cmd in enumerate(self.command_history, 1):
            self._print_colored(f"  {i}. {cmd}", Fore.CYAN)

    def run(self):
        """Main interaction loop"""
        # Display enhanced banner
        self._print_colored("🤖 DeepSeek Coding Agent - Enhanced UI/UX Version", Fore.CYAN, Style.BRIGHT)
        print("=" * 60)
        self._print_colored("🔒 Safety features: Command confirmation required", Fore.GREEN)
        self._print_colored("🎨 Enhanced UI: Colors, progress bars, and validation", Fore.BLUE)
        self._print_colored("⚙️  Configurable: Run 'settings' to customize", Fore.YELLOW)
        print("=" * 60)
        self._print_info("Type 'help' for detailed usage information")
        
        # Initial greeting
        initial_response = self.call_deepseek_api(self.conversation_history)
        if initial_response:
            self.conversation_history.append({"role": "assistant", "content": initial_response})
            self.process_response(initial_response)
        
        # Main loop
        while self.session_active:
            try:
                prompt = f"\n{Fore.GREEN}🧠 You:{Style.RESET_ALL} "
                user_input = self._validate_input(prompt)
                
                if user_input is None:
                    continue
                
                user_input_lower = user_input.lower()
                
                if user_input_lower in ['exit', 'quit', 'bye']:
                    self._print_system("Shutting down agent. Goodbye!")
                    self.session_active = False
                elif user_input_lower == 'clear':
                    self.conversation_history = [
                        {"role": "system", "content": SYSTEM_PROMPT},
                        {"role": "user", "content": "Conversation history was cleared. Please acknowledge."}
                    ]
                    self._print_success("Conversation history cleared.")
                elif user_input_lower == 'help':
                    self.show_help()
                elif user_input_lower == 'config':
                    self.show_config()
                elif user_input_lower == 'settings':
                    self.update_config()
                elif user_input_lower == 'history':
                    self.show_command_history()
                else:
                    self.handle_user_input(user_input)
                    
            except KeyboardInterrupt:
                self._print_warning("\nInterrupted by user. Type 'exit' to quit or continue chatting.")
            except EOFError:
                self._print_warning("\nEnd of input received. Shutting down.")
                self.session_active = False
            except Exception as e:
                self._print_error(f"Unexpected error: {e}")

def main():
    """Main entry point"""
    try:
        agent = DeepSeekAgent()
        agent.run()
    except KeyboardInterrupt:
        agent._print_warning("\nInterrupted during startup. Goodbye!")
    except Exception as e:
        if 'agent' in locals():
            agent._print_error(f"Fatal error: {e}")
        else:
            print(f"💥 Fatal error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()
