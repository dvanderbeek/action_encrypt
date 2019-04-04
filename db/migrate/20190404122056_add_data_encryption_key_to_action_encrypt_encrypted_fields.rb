class AddDataEncryptionKeyToActionEncryptEncryptedFields < ActiveRecord::Migration[5.2]
  def change
    add_reference :action_encrypt_encrypted_fields, :data_encryption_key, type: :uuid, foreign_key: { to_table: :action_encrypt_data_encryption_keys }
  end
end
