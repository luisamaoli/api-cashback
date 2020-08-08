class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.integer :ticket_value
      t.float :cashback_value

      t.timestamps
    end
  end
end
