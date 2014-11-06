class CreateParameters < ActiveRecord::Migration
  def change
    create_table :parameters do |t|
      t.string :us_code
      t.string :us_name
      t.string :us_street
      t.string :us_city
      t.string :us_house
      t.string :us_nip
      t.string :us_regon
      t.string :us_www
      t.string :us_tel
      t.string :us_fax
      t.timestamps
    end
  end
end
