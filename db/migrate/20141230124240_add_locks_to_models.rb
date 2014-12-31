class AddLocksToModels < ActiveRecord::Migration
  def change
    add_column :users, :lock_version, :integer, :default => 0, :null => false
    add_column :questions, :lock_version, :integer, :default => 0, :null => false
    add_column :poltaxconns, :lock_version, :integer, :default => 0, :null => false
    add_column :parameters, :lock_version, :integer, :default => 0, :null => false
    add_column :levels, :lock_version, :integer, :default => 0, :null => false  #nie do końca dobrze
    add_column :checks, :lock_version, :integer, :default => 0, :null => false
    add_column :answers, :lock_version, :integer, :default => 0, :null => false #nie wiem jak to dziala
  end
end
