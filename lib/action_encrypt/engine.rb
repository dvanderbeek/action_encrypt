require "attr_encrypted"
require "active_record/railtie"

module ActionEncrypt
  class Engine < ::Rails::Engine
    isolate_namespace ActionEncrypt

    initializer "action_text.attribute" do
      ActiveSupport.on_load(:active_record) do
        include ActionEncrypt::Attribute
      end
    end
  end
end
