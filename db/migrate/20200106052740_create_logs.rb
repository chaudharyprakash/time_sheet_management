class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.references :log_date, null: false, foreign_key: true
      t.string :details
      t.string :time_taken
      t.string :commit
      t.string :link
      t.string :commit_hash
      t.integer :project_id

      t.timestamps
    end
  end
end
