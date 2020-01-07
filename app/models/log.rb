class Log < ApplicationRecord
  belongs_to :log_date
  belongs_to :project, optional: true
end
