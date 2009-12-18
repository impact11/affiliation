class TrackController < ApplicationController
	# TODO: Move to external config
	TRACKBACK_WHITELIST = [
		"10.0.2.2"
	]

	before_filter :check_whitelist

	# Create a new trackback record for the first click-through
	def index 
		if params[:code]

			@trackback = Trackback.first( :session_id => session[:session_id])

			# If trackback exists
			if @trackback
				if params[:order_number] && params[:order_amount]
					create_page_view
					create_payable_action(Order)
					render_success(:trackback => { :action => "ORDER" })
				else
					create_page_view
					render_success(:trackback => { :action => "UPDATE" })
				end

			# If it's a new trackback
			else
				# Find the trackback code
				@trackback_code = TrackbackCode.first( :name => params[:code] )
				if @trackback_code
					create_trackback
					create_page_view
					render_success(:trackback => { :action => "NEW" })

				# If no trackback code found
				else
					render_error("Affiliate code was not found", :status => 404)
				end
			end
		else
			render_error("Affiliate code not present")
		end
	end

	private
	def create_trackback
		@trackback = Trackback.create(
			:session_id => session[:session_id],
			:trackback_code_name => @trackback_code.name,
			:host => get_host,
			:action => "NEW" 
		)
	end

	def create_page_view 
		PageView.create( :host => get_host, :viewed => get_viewed, :trackback_id => @trackback.session_id )
	end

	def create_payable_action(type = Order)
		@payable_action = type.create( 
			:user_id => @trackback.trackback_code.user_id, 
			:trackback_code_name => @trackback.trackback_code_name,
			:trackback_id => @trackback.session_id,
			:order_number => params[:order_number],
			:order_amount => params[:order_amount]
		)
	end

	def check_whitelist
		unless TRACKBACK_WHITELIST.include?(request.remote_ip)
			render_error("Unauthorized", :status => 401)
		end
	end

	def render_success(json)
		json = { :status => "success", :status_code => 200, :time => timestamp }.merge(json)
		render :json => json
	end

	def render_error(message, options = {})
		status = options[:status] ? options[:status] : 400
		render(:json => { :error_message => message, :status => "error", :status_code => status, :time => timestamp }, :status => status)
	end

	def timestamp
		DateTime.now.strftime("%Y:%m:%d %H:%M:%S")
	end

	def get_host
		request.referrer.split(request.protocol).last.split("/").first		
	end

	def get_viewed
		request.referrer.split(request.protocol).last.gsub(get_host, "")
	end

end
