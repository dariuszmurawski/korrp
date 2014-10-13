class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.integer :user_id
      t.string :forename
      t.string :name
      t.string :org_name
      t.string :city
      t.string :postal_code
      t.string :street
      t.string :home_no
      t.integer :flat_no
      t.integer :pesel
      t.integer :regon
      t.integer :nip
      t.string :pkd_full
      t.string :pkd_branch
      t.string :branch
      t.boolean :cancelled, default: false


      t.timestamps
    end
  end
end
