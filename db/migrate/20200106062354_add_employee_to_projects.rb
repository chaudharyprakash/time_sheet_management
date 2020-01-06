class AddEmployeeToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :employee_id, :integer
  end
end
