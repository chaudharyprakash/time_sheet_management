class Log < ApplicationRecord
  belongs_to :log_date
  belongs_to :project, optional: true

  def details_display
		details.include?(">>>") ? details.split(">>>").first : details 	
  end
end
