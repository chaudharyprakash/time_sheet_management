class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :repo_name
      t.string :pm_emails
      t.boolean :send_status_email

      t.timestamps
    end
  end
end
