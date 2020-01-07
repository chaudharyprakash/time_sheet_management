class AddUrlToEmployee < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :bitbucket_username, :string
    add_column :employees, :github_username, :string
    add_column :logs, :branch_name, :string
  end
end
