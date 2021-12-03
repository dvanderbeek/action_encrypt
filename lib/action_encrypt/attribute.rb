# frozen_string_literal: true

module ActionEncrypt
  module Attribute
    extend ActiveSupport::Concern

    class_methods do
      def search_encrypted(name, opts = {})
        require 'blind_index'

        blind_index :"#{name}", key: [Rails.application.credentials.blind_index_key].pack("H*")

        before_validation :"compute_#{name}_bidx"

        if opts[:unique] == true
          validates :"#{name}", uniqueness: true, allow_nil: true
        end
      end

      def has_encrypted(name)
        class_eval <<-CODE, __FILE__, __LINE__ + 1
          def #{name}
            #{name}_encrypted_field.blob
          end

          def #{name}=(value)
            #{name}_encrypted_field.blob = value
          end

          def #{name}_encrypted_field
            super || build_#{name}_encrypted_field
          end
        CODE

        has_one :"#{name}_encrypted_field", -> { where(name: name) },
          class_name: "ActionEncrypt::EncryptedField",
          as: :record,
          inverse_of: :record,
          autosave: true,
          dependent: :destroy

        scope :"with_#{name}_encrypted_field", -> { includes("#{name}_encrypted_field": :data_encryption_key) }
      end
    end
  end
end
