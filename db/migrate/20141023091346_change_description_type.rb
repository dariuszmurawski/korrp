class ChangeDescriptionType < ActiveRecord::Migration
  def change
    change_column :questions, :description, :text
    change_column :answers, :q_description, :text
  end
end
