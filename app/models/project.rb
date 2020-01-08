class Project < ApplicationRecord
  belongs_to :employee
  has_many :logs

  def display_name
  	name || repo_name
  end
end
