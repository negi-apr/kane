class RemoveIntegerToPayments < ActiveRecord::Migration[5.1]
  def change
    remove_column :payments, :integer, :string
  end
end
