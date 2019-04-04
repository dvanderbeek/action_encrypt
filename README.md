# ActionEncrypt
Add encrypted fields to ActiveRecord models easily

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'action_encrypt'
```

And then execute:
```bash
$ bundle
```

Install migrations:
```bash
$ rails action_encrypt:install:migrations
```

Add a key_encryption_key to your Rails encrypted credentials file. Generate
one using `SecureRandom.hex(32)`
```yml
key_encryption_key: <<key>>
```

Create a Data Encryption Key
```bash
$ ActionEncrypt::DataEncryptionKey.generate!(primary: true)
```

Add an encrypted field to your models
```ruby
class User < ApplicationRecord
  has_encrypted :ssn
end
```

Now you can use user.ssn as you would any other attribute, but it will be stored
securely in the action_encrypt_encrypted_fields table.

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
