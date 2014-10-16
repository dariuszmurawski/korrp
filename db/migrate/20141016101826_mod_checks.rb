class ModChecks < ActiveRecord::Migration
  def change
    add_column :checks, :score, :integer
    add_column :checks, :level, :string
  end
end
