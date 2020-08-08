class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.references :customer, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
