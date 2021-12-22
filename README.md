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

Create `action_encrypt.rb` in your initializers folder and set encryption keys. Generate them
using `SecureRandom.hex(32)`. You can decide between storing the values in ENV or using rails encrypted credentials system.

```ruby
ActionEncrypt.configure do |config|
  config.key_encryption_key = ENV.fetch('KEY_ENCRYPTION_KEY')
  config.blind_index_key = ENV.fetch('BLIND_INDEX_KEY')
end
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
