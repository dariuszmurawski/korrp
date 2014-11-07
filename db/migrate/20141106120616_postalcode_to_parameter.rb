class PostalcodeToParameter < ActiveRecord::Migration
  def change
    add_column :parameters, :us_postalcode, :string
  end
end
