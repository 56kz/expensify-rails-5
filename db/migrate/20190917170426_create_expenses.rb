class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.date :date
      t.string :concept
      t.integer :type
      t.integer :category
      t.decimal :amount

      t.timestamps
    end
  end
end
