class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :description
      t.integer :strength
      t.boolean :cancelled, default: false

      t.timestamps
    end
  end
end
