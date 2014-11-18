class AddLoginEditChecks < ActiveRecord::Migration
  def change
    add_column :checks, :userloginedit, :string
  end
end
