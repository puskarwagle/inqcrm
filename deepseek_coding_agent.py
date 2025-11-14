import os
import re
import sys
import subprocess
import requests
from dotenv import load_dotenv

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

class DeepSeekAgent:
    def __init__(self):
        self.conversation_history = [
            {"role": "system", "content": SYSTEM_PROMPT},
            {"role": "user", "content": "You are now my terminal coding agent. Acknowledge readiness and confirm you understand the safety rules."}
        ]
        self.session_active = True

    def call_deepseek_api(self, messages, max_retries=3):
        """Make API call with proper error handling and retries"""
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

        for attempt in range(max_retries):
            try:
                response = requests.post(
                    DEEPSEEK_URL, 
                    json=payload, 
                    headers=headers, 
                    timeout=60
                )
                
                if response.status_code == 200:
                    return response.json()["choices"][0]["message"]["content"]
                else:
                    print(f"⚠️ API Error (attempt {attempt + 1}/{max_retries}): {response.status_code}")
                    if attempt == max_retries - 1:
                        print(f"❌ Final failure: {response.text}")
                        return None
            except requests.exceptions.Timeout:
                print(f"⏰ Timeout (attempt {attempt + 1}/{max_retries})")
            except requests.exceptions.RequestException as e:
                print(f"🌐 Network error (attempt {attempt + 1}/{max_retries}): {e}")

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
        print(f"⚙️ Proposed command: {command}")
        
        # Safety checks - expand this list as needed
        dangerous_patterns = [
            r'rm\s+-rf', r'rm\s+-\*', r'mkfs', r'dd\s+if=.*of=/dev/',
            r'>\s+/dev/sd', r'format\s+', r'fdisk\s+/dev/', r'chmod\s+[0-7]{3,4}\s+',
            r'curl.*\|s*h', r'wget.*\|s*h'
        ]
        
        for pattern in dangerous_patterns:
            if re.search(pattern, command, re.IGNORECASE):
                print(f"🚨 SAFETY BLOCKED: This command matches dangerous pattern: {pattern}")
                return False
        
        # Ask for confirmation
        try:
            confirm = input("🔒 Execute this command? [y/N]: ").strip().lower()
            if confirm not in ['y', 'yes']:
                print("❌ Command execution cancelled.")
                return False
            
            print(f"🚀 Executing: {command}\n" + "="*50)
            result = subprocess.run(
                command, 
                shell=True, 
                capture_output=True, 
                text=True,
                timeout=300  # 5 minute timeout
            )
            
            print(f"STDOUT:\n{result.stdout}")
            if result.stderr:
                print(f"STDERR:\n{result.stderr}")
            print(f"Return code: {result.returncode}")
            print("="*50)
            
            return True
            
        except subprocess.TimeoutExpired:
            print("⏰ Command timed out after 5 minutes")
            return False
        except Exception as e:
            print(f"💥 Error executing command: {e}")
            return False

    def process_response(self, response):
        """Process API response and handle commands"""
        if not response:
            return
        
        print("\n💬 DeepSeek Response:")
        print("-" * 40)
        print(response)
        print("-" * 40)
        
        # Extract and execute commands
        commands = self.extract_commands(response)
        for command in commands:
            self.execute_command(command)

    def handle_user_input(self, user_input):
        """Process user input and get response"""
        if not user_input.strip():
            return
            
        self.conversation_history.append({"role": "user", "content": user_input})
        
        print("🔄 Thinking...")
        response = self.call_deepseek_api(self.conversation_history)
        
        if response:
            self.conversation_history.append({"role": "assistant", "content": response})
            self.process_response(response)
        else:
            print("❌ Failed to get response from DeepSeek API")

    def run(self):
        """Main interaction loop"""
        print("🤖 DeepSeek Coding Agent - Enhanced Version")
        print("=" * 50)
        print("🔒 Safety features: Command confirmation required")
        print("💡 Type 'help' for usage, 'clear' to reset, 'exit' to quit")
        print("=" * 50)
        
        # Initial greeting
        initial_response = self.call_deepseek_api(self.conversation_history)
        if initial_response:
            self.conversation_history.append({"role": "assistant", "content": initial_response})
            self.process_response(initial_response)
        
        # Main loop
        while self.session_active:
            try:
                user_input = input("\n🧠 You: ").strip()
                
                if user_input.lower() in ['exit', 'quit', 'bye']:
                    print("👋 Shutting down agent. Goodbye!")
                    self.session_active = False
                elif user_input.lower() == 'clear':
                    self.conversation_history = [
                        {"role": "system", "content": SYSTEM_PROMPT},
                        {"role": "user", "content": "Conversation history was cleared. Please acknowledge."}
                    ]
                    print("🧹 Conversation history cleared.")
                elif user_input.lower() == 'help':
                    self.show_help()
                else:
                    self.handle_user_input(user_input)
                    
            except KeyboardInterrupt:
                print("\n\n⚠️ Interrupted by user. Type 'exit' to quit or continue chatting.")
            except EOFError:
                print("\n\n👋 End of input received. Shutting down.")
                self.session_active = False
            except Exception as e:
                print(f"\n💥 Unexpected error: {e}")

    def show_help(self):
        """Show help information"""
        help_text = """
🤖 DeepSeek Coding Agent Help:

Basic Commands:
  'exit', 'quit', 'bye' - Exit the agent
  'clear' - Clear conversation history
  'help' - Show this help message

Features:
  • Safe command execution with confirmation
  • Dangerous command detection
  • 5-minute command timeout
  • API error retry mechanism
  • Conversation history management

Command Format:
  The agent will suggest commands prefixed with #RUN:
  You must confirm each command before execution.

Safety:
  • Always review commands before executing
  • Dangerous operations are automatically blocked
  • Commands run in your current shell environment
        """
        print(help_text)

def main():
    """Main entry point"""
    try:
        agent = DeepSeekAgent()
        agent.run()
    except KeyboardInterrupt:
        print("\n👋 Interrupted during startup. Goodbye!")
    except Exception as e:
        print(f"💥 Fatal error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()