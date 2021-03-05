class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :status
      t.string :account_tipe
      t.string :service
      t.integer :booking_id
      t.integer :user_id

      t.timestamps
    end
    add_index :accounts, :booking_id
    add_index :accounts, :user_id
  end
end
