class TrackbackCode 
	include Friendly::Document

	attribute :user_id, Integer	
	attribute :name, String
	attribute :percentage, Float

	indexes :user_id
	indexes :name
	indexes :percentage

	def user
		User.find(self.user_id)
	end

	def affiliate
		self.user
	end

	def trackbacks
		Trackback.all( :trackback_code_name => self.name )
	end
end
