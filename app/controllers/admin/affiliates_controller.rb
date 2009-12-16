class Admin::AffiliatesController < ApplicationController
	layout "admin"
	before_filter :login_required
	access_control [ :index, :new, :update, :edit ] => '(root)'

	def index
		@affiliates = Affiliate.find(:all)
	end

	def new
		@affiliate = Affiliate.new
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end
end
