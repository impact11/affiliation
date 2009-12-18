class PageView
	include Friendly::Document
	
	attribute :trackback_id, String 
	attribute :host, String
	attribute :viewed, String

	indexes :trackback_id
	indexes :host

	def trackback
		if self.trackback_id && self.trackback_id != ""
			Trackback.first( :session_id => self.trackback_id )
		end
		nil
	end
end
