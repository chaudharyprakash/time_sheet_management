class LogDate < ApplicationRecord
  belongs_to :employee
  has_many :logs
end
