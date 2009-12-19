class Admin::RolesController < ApplicationController
	layout "admin"
	before_filter :login_required
	access_control [ :index, :new, :update, :edit ] => '(admin)'

	def index
	end

	def new
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
