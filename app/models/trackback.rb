require 'digest/sha1'

class Trackback 
	include Friendly::Document

	attribute :default, String
	attribute :session_id, String
	attribute :trackback_code_name, String 
	attribute :host, String

	DEFAULT = "NEW"

	indexes :default
	indexes :session_id
	indexes :trackback_code_name
	indexes :host
	indexes :created_at

	def trackback_code
		TrackbackCode.first( :name => self.trackback_code_name )	
	end
	
	def page_views
		PageView.all( :trackback_id => self.session_id )
	end

end
