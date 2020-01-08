class CommitWebhooksController < ApplicationController
	skip_before_action :verify_authenticity_token

	def create
		return if params[:push].blank?
		repo_name = params[:repository][:name]
		params["push"]["changes"].each do |change|
			auther_name = change[:new][:target][:author][:user][:nickname]
			message = change[:new][:target][:message]
			time_taken = message.include?(">>>") ? message.split(">>>").last : "1:00"
			commit_hash = change[:new][:target][:hash]
			commit_link = change[:new][:target][:links][:self][:href]
			branch_name = change[:new][:name]
			
			employee = Employee.find_by("bitbucket_username = ? OR github_username = ?", auther_name, auther_name)
			if employee.present?
				project = employee.projects.find_or_create_by(repo_name: repo_name)
				log_date = employee.log_dates.find_or_create_by(date: Time.zone.now.to_date)
				log_date.logs.create(employee_id: employee.id, 
															details: message, 
															commit_hash: commit_hash, 
															commit: message,
															branch_name: branch_name, 
															link: commit_link, 
															project_id: project.id,
															time_taken: time_taken)
			end
		end
		render json:{status: 200}
	rescue => exception
		render json:{status: 500, message: exception.message, backtrace: exception.backtrace }
	end
end
