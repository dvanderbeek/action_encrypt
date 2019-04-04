class CreateActionEncryptEncryptedFields < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'pgcrypto'

    create_table :action_encrypt_encrypted_fields, id: :uuid do |t|
      t.string :encrypted_blob
      t.string :encrypted_blob_iv
      t.string :name, null: false
      t.uuid :record_id
      t.string :record_type

      t.timestamps

      t.index [:record_type, :record_id, :name], name: "index_action_encrypt_fields_uniqueness", unique: true
    end
  end
end
