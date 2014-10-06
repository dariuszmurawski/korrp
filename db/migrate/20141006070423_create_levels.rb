class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.string :description
      t.integer :value

      t.timestamps
    end
  end
end
