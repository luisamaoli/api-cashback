class CreateBalances < ActiveRecord::Migration[6.0]
  def change
    create_table :balances do |t|
      t.float :cashback_balance
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
