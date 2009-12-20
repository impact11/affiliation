class AdminController < ApplicationController

	before_filter :login_required
	access_control [ :index, :new, :update, :edit ] => '(admin)'

	def index
		end_date = DateTime.now
		start_date = end_date - 30.days

		@affiliates_pending 		= Affiliate.count( :conditions => ["approved_at IS NULL"])
		@commissions_pending 		= PayableAction.pending
		@commissions_approved 	= PayableAction.approved

		@traffic_stats 		= Stats::Traffic.new( :start_date => start_date, :end_date => end_date )
		@search_stats 		= Stats::Search.new( :start_date => start_date, :end_date => end_date )
		@affiliate_stats 	= Stats::Affiliates.new( :start_date => start_date, :end_date => end_date )

	end
end
