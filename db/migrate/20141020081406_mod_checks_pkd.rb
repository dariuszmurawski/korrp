class ModChecksPkd < ActiveRecord::Migration
  def change
    add_column :checks, :pkdfull, :string
    remove_column :checks, :pkd_full
    remove_column :checks, :pkd_id
    remove_column :checks, :pkd_branch
  end
end
