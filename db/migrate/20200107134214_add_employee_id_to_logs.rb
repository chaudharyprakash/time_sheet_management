class AddEmployeeIdToLogs < ActiveRecord::Migration[6.0]
  def change
    add_column :logs, :employee_id, :integer
  end
end
