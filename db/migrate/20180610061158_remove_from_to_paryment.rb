class RemoveFromToParyment < ActiveRecord::Migration[5.1]
  def change
    remove_column :payments, :from, :integer
    remove_column :payments, :to, :integer
  end
end
