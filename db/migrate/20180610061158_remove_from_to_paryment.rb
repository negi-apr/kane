class RemoveFromToParyment < ActiveRecord::Migration[5.1]
  def change
    remove_column :payments, :from_id, :integer
    remove_column :payments, :to_id, :integer
    remove_column :payments, :payment_id, :integer

  end
end
