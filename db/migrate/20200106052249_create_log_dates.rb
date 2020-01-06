class CreateLogDates < ActiveRecord::Migration[6.0]
  def change
    create_table :log_dates do |t|
      t.date :date
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
