class UniqueIndexIvColumns < ActiveRecord::Migration[5.2]
  def change
    add_index :action_encrypt_data_encryption_keys, :encrypted_key_iv, unique: true
    add_index :action_encrypt_encrypted_fields, :encrypted_blob_iv, unique: true
  end
end
