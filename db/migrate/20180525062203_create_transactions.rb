class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :payment_id
      t.integer :from_id
      t.integer :to_id
      t.boolean :resolved
      t.boolean :deleted

      t.timestamps
    end
  end
end
