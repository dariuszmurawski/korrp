class ModChecksUserIdChange < ActiveRecord::Migration
  def change
     remove_column :checks, :user_id
     add_column :checks, :userlogin, :string
  end
end
