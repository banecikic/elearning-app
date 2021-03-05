class AddUserIdToAccount < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :user_id, :string
  end
end
