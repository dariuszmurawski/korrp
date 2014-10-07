class CreatePkds < ActiveRecord::Migration
  def change
    create_table :pkds do |t|
      t.string :pkd_id
      t.string :pkd_name
      t.string :branch
      t.string :description

      t.timestamps
    end
  end
end
