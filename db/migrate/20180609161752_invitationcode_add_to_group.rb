class InvitationcodeAddToGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :code, :string
  end
end
