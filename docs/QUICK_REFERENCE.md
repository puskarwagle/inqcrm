# Quick Reference: AI Standards Cheat Sheet

**Purpose:** Fast lookup guide for developers and AI agents  
**Updated:** November 14, 2025

---

## Technology Stack (REQUIRED)

```
PHP 8.2+         ← Must use strict types
Laravel 10.0+    ← Current LTS
Pest 2.6+        ← Testing framework
Concord 1.10+    ← Package management
```

**⚠️ VIOLATION:** Using PHP 8.1, Laravel 9, or PHPUnit = INCORRECT

---

## File Naming Quick Reference

| Type | Pattern | Example |
|------|---------|---------|
| Class | PascalCase | `ContactRepository.php` |
| Interface | Suffix "Contract" | `ContactContract.php` |
| Controller | `*Controller` | `ContactController.php` |
| Model | Singular | `Contact.php` |
| Repository | `*Repository` | `ContactRepository.php` |
| Request | `*Request` | `CreateContactRequest.php` |
| Resource | `*Resource` | `ContactResource.php` |
| Migration | `YYYY_MM_DD_*_table` | `2025_11_14_120000_create_contacts_table.php` |
| Seeder | `*Seeder` | `ContactsTableSeeder.php` |
| Trait | Descriptive | `HasTimestamps.php` |
| Exception | `*Exception` | `InvalidContactException.php` |

---

## Directory Structure Skeleton

```
packages/Webkul/ModuleName/
├── composer.json              ← Add Concord config
├── src/
│   ├── Module.php             ← Concord module class
│   ├── Contracts/             ← Interfaces
│   ├── Models/                ← Eloquent models
│   ├── Repositories/          ← Data layer
│   ├── Providers/
│   │   └── ModuleNameServiceProvider.php
│   ├── Http/
│   │   ├── Controllers/
│   │   ├── Requests/          ← Form validation
│   │   ├── Resources/         ← API responses
│   │   └── Middleware/
│   ├── Database/
│   │   ├── Migrations/
│   │   └── Seeders/
│   ├── Exceptions/
│   ├── Listeners/             ← Event handlers
│   ├── Traits/
│   ├── Facades/
│   ├── Helpers/
│   └── Routes/
├── tests/                     ← Pest tests
├── resources/
└── config/                    ← Package config
```

---

## Namespace Pattern

```
Webkul\{Module}\{SubNamespace}\{Class}

Examples:
Webkul\Contact\Models\Contact
Webkul\Contact\Repositories\ContactRepository
Webkul\Contact\Http\Controllers\ContactController
Webkul\Contact\Http\Requests\CreateContactRequest
Webkul\Contact\Contracts\ContactContract
```

---

## Database Naming

| Element | Format | Example |
|---------|--------|---------|
| Table | Plural snake_case | `contacts`, `email_templates` |
| Column | snake_case | `first_name`, `is_active` |
| Foreign Key | `{table}_id` | `contact_id`, `user_id` |
| Boolean | `is_*` or `has_*` | `is_active`, `has_read_emails` |
| Timestamp | `created_at`, `updated_at` | ✓ Use timestamps() |
| Soft Delete | `deleted_at` | ✓ Use softDeletes() |

---

## Code Patterns

### ✅ ALWAYS USE

```php
// 1. Type hints
public function find(int $id): ?Contact { }

// 2. Constructor injection
public function __construct(private ContactRepository $repo) { }

// 3. Form request validation
public function store(CreateContactRequest $request) { }

// 4. Try-catch for DB operations
try {
    $result = $this->repo->create($data);
} catch (\Exception $e) {
    \Log::error('Operation failed', ['error' => $e->getMessage()]);
}

// 5. Eloquent relationships
return $this->belongsTo(User::class);

// 6. Soft deletes
use SoftDeletes;

// 7. Input escaping in Blade
{{ $contact->email }}  ← Escaped automatically

// 8. Pest tests with describe blocks
describe('ContactRepository', function () {
    it('creates a contact', function () {
        // test code
    });
});
```

### ❌ NEVER USE

```php
// 1. No type hints
public function find($id) { }

// 2. Direct $_POST access
$email = $_POST['email'];

// 3. Unvalidated input
Contact::create(request()->all());

// 4. Raw SQL concatenation
DB::select("SELECT * WHERE email = '" . $email . "'");

// 5. Silent error catching
try { } catch (\Exception $e) { }

// 6. Unescaped output
{!! $contact->email !!}  ← XSS vulnerability

// 7. PHPUnit tests
use PHPUnit\Framework\TestCase;

// 8. God objects (too many methods)
class ContactController { /* 30+ methods */ }
```

---

## Pest Testing Structure

```php
describe('Feature', function () {
    let('resource', fn() => new YourClass());
    
    beforeEach(function () {
        // Setup before each test
    });

    describe('nested group', function () {
        it('does something', function () {
            expect($result)->toBe($expected);
        });

        it('fails correctly', function () {
            $this->expectException(Exception::class);
            // Code that throws
        });
    });
});
```

**Test naming:** `it('describes what should happen')`  
**Assertions:** `expect($value)->method()->toBe(...)`

---

## Security Checklist

- [ ] All user input validated via FormRequest
- [ ] No raw SQL queries (use Eloquent)
- [ ] No unescaped output in Blade
- [ ] Authorization checks on sensitive operations
- [ ] Soft deletes for sensitive data
- [ ] Passwords/tokens never logged
- [ ] SQL injection protection (parameterized queries)
- [ ] XSS protection (escaped output)
- [ ] CSRF token on forms (Laravel automatic)

---

## composer.json Template

```json
{
    "name": "krayin/laravel-module-name",
    "license": "MIT",
    "require": {
        "php": "^8.2",
        "krayin/laravel-core": "^1.0"
    },
    "autoload": {
        "psr-4": { "Webkul\\ModuleName\\": "src/" }
    },
    "extra": {
        "laravel": {
            "providers": [
                "Webkul\\ModuleName\\Providers\\ModuleNameServiceProvider"
            ]
        },
        "concord": {
            "modules": ["Webkul\\ModuleName"]
        }
    }
}
```

---

## Module Class Template

```php
<?php

namespace Webkul\ModuleName;

use Konekt\Concord\Module as BaseModule;

class Module extends BaseModule
{
    public static function getId(): string
    {
        return 'webkul.module-name';
    }

    public static function getName(): string
    {
        return 'Module Display Name';
    }

    public static function getVersion(): string
    {
        return '1.0.0';
    }
}
```

---

## Common Commands

```bash
# Run Pest tests
./vendor/bin/pest

# Run specific test file
./vendor/bin/pest tests/Feature/ContactTest.php

# Code formatting (Laravel Pint)
./vendor/bin/pint

# Create migration
php artisan make:migration create_contacts_table

# Generate from stub
php artisan package:generate --help

# Clear cache
php artisan cache:clear
```

---

## Error Handling Template

```php
try {
    $data = $request->validated();
    $contact = $this->repository->create($data);
    
    return response()->json([
        'status'  => 'success',
        'message' => 'Contact created successfully',
        'data'    => $contact,
    ], 201);
    
} catch (ValidationException $e) {
    return response()->json([
        'status'  => 'error',
        'message' => 'Validation failed',
        'errors'  => $e->errors(),
    ], 422);
    
} catch (Exception $e) {
    \Log::error('Contact creation failed', [
        'error' => $e->getMessage(),
        'file'  => $e->getFile(),
        'line'  => $e->getLine(),
    ]);
    
    return response()->json([
        'status'  => 'error',
        'message' => 'An error occurred while creating contact',
    ], 500);
}
```

---

## Model Template

```php
<?php

namespace Webkul\Contact\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Contact extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'first_name', 'last_name', 'email', 'phone', 'user_id'
    ];

    protected $casts = [
        'is_active' => 'boolean',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }
}
```

---

## Migration Template

```php
<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('contacts', function (Blueprint $table) {
            $table->id();
            $table->string('first_name');
            $table->string('email')->unique();
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->boolean('is_active')->default(true);
            $table->softDeletes();
            $table->timestamps();
            
            $table->index(['user_id', 'created_at']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('contacts');
    }
};
```

---

## FormRequest Template

```php
<?php

namespace Webkul\Contact\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CreateContactRequest extends FormRequest
{
    public function authorize(): bool
    {
        return auth()->check();
    }

    public function rules(): array
    {
        return [
            'first_name' => ['required', 'string', 'max:255'],
            'email'      => ['required', 'email', 'unique:contacts'],
            'phone'      => ['nullable', 'string', 'max:20'],
        ];
    }

    public function messages(): array
    {
        return [
            'email.unique' => 'Email already registered.',
        ];
    }
}
```

---

## Quick Links

- **Main Standards:** `AI_AGENT_CODING_STANDARDS.md`
- **Detailed Review:** `DOCUMENT_REVIEW_AND_IMPROVEMENTS.md`
- **Review Summary:** `REVIEW_SUMMARY.md`
- **This Cheat Sheet:** `QUICK_REFERENCE.md`

---

**Last Updated:** November 14, 2025  
**Status:** ✅ CURRENT  
**For Questions:** See AI_AGENT_CODING_STANDARDS.md for detailed explanations
