require "active_support"
require "active_support/rails"
require "action_encrypt/engine"

module ActionEncrypt
  extend ActiveSupport::Autoload

  autoload :Attribute
  autoload :Configuration

  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end
  end
end
