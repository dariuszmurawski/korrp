class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :check_id
      t.string  :q_description
      t.integer :q_strength
      t.boolean :q_answer, default: false
      
      
      t.timestamps
    end
  end
end
