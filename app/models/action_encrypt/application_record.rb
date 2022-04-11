module ActionEncrypt
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true

    if defined?(ActiveRecord::Encryption) == 'constant'
      @encrypted_attributes = {}

      def self.encrypted_attributes
        @encrypted_attributes ||= superclass.encrypted_attributes.dup
      end

      def encrypted_attributes
        @encrypted_attributes ||= begin
          duplicated= {}
          self.class.encrypted_attributes.map { |key, value| duplicated[key] = value.dup }
          duplicated
        end
      end
    end
  end
end
