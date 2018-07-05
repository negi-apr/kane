class RenameTransactionPayment < ActiveRecord::Migration[5.1]
  def change
    rename_table :transactions, :payments
  end
end
