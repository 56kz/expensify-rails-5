class CreateCathandlers < ActiveRecord::Migration[5.0]
  def change
    create_table :cathandlers do |t|
      t.string :name

      t.timestamps
    end
  end
end
