# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem

  helper :all # include all helpers, all the time
  protect_from_forgery :secret => 'c59d628fe47ff27c42dab3fa9dca788a758433f70f9824a3c03e24ee8b7edffef52513bc46225e5b1e99f9d7e7940cc0691a5f9c9c0b5461fd8513225f28adca' 

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

	def permission_denied
		redirect_to "/denied"
	end
end
