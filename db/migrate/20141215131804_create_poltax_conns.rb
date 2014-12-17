class CreatePoltaxConns < ActiveRecord::Migration
  def change
    create_table :poltaxconns do |t|
      t.string  :database
      t.string  :username
      t.string  :password
      t.timestamps
    end
  end
end
