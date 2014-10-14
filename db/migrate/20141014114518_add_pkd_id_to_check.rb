class AddPkdIdToCheck < ActiveRecord::Migration
  def change
    add_column :checks, :pkd_id, :integer
  end
end
