class CreateTypehandlers < ActiveRecord::Migration[5.0]
  def change
    create_table :typehandlers do |t|
      t.string :name

      t.timestamps
    end
  end
end
