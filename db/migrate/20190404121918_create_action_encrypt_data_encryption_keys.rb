class CreateActionEncryptDataEncryptionKeys < ActiveRecord::Migration[5.2]
  def change
    create_table :action_encrypt_data_encryption_keys, id: :uuid do |t|
      t.string :encrypted_key
      t.string :encrypted_key_iv
      t.boolean :primary

      t.timestamps
    end
  end
end
