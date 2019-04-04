module ActionEncrypt
  class EncryptedField < ApplicationRecord
    belongs_to :record, polymorphic: true
    belongs_to :data_encryption_key

    attr_encrypted :blob, key: :encryption_key

    def encryption_key
      self.data_encryption_key ||= DataEncryptionKey.primary
      [data_encryption_key.key].pack("H*")
    end

    def reencrypt!(new_key)
      update_attributes!(data_encryption_key: new_key, blob: blob)
    end
  end
end
