class LogsController < ApplicationController
  before_action :authenticate_employee!

  def index
  	@logs = current_employee.logs.order(log_date_id: :desc)
  end
end
