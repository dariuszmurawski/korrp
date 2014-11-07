class AddKieraToUsers < ActiveRecord::Migration
  def change
     add_column :users, :kiera, :boolean, default: false
  end
end
