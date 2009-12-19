class PageView
	include Friendly::Document

	attr_accessor :extra_data

	attribute :default, String
	attribute :trackback_id, String 
	attribute :host, String
	attribute :viewed, String
	attribute :extra, String

	DEFAULT = "NEW"

	indexes :default
	indexes :trackback_id
	indexes :host
	indexes :extra
	indexes :created_at

	def trackback
		if self.trackback_id && self.trackback_id != ""
			Trackback.first( :session_id => self.trackback_id )
		end
		nil
	end

	def get_extra_data
		return self.extra_data if self.extra_data
		return get_extra_data!
	end

	def get_extra_data!
		if self.extra != "" 
			self.extra_data = JSON.parse(self.extra) 
		else
			self.extra_data = {} 
		end
		self.extra_data
	end
end
