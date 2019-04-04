require "active_support"
require "active_support/rails"
require "action_encrypt/engine"

module ActionEncrypt
  extend ActiveSupport::Autoload

  autoload :Attribute
end
