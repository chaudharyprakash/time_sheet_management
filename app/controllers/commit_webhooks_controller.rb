class CommitWebhooksController < ApplicationController
	skip_before_action :verify_authenticity_token

	def create
		byebug
		return if params[:push].blank?
	end
end
