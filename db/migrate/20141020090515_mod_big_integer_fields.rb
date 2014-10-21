class ModBigIntegerFields < ActiveRecord::Migration
  def change
    change_column :checks, :nip, :string
    change_column :checks, :pesel, :string
    change_column :checks, :regon, :string
    change_column :checks, :flat_no, :string
  end
end
