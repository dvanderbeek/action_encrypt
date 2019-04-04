module ActionEncrypt
  class DataEncryptionKey < ApplicationRecord
    attr_encrypted :key, key: :encryption_key

    scope :primary, -> { find_by(primary: true) }
    scope :unused, -> { where.not(primary: true, id: EncryptedField.pluck(:data_encryption_key_id).uniq) }

    def self.generate!(attrs={})
      create!(attrs.merge(key: SecureRandom.hex(32)))
    end

    def encryption_key
      [Rails.application.credentials.key_encryption_key].pack("H*")
    end

    def promote!
      transaction do
        DataEncryptionKey.primary.update_attributes!(primary: false)
        update_attributes!(primary: true)
      end
    end
  end
end
