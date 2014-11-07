class EmailToParameter < ActiveRecord::Migration
  def change
    add_column :parameters, :us_email, :string
  end
end
