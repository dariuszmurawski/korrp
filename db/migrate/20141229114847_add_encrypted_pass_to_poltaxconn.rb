class AddEncryptedPassToPoltaxconn < ActiveRecord::Migration
  def change
    add_column :poltaxconns, :encrypted_password, :string
  end
end
