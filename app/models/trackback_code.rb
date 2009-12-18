class TrackbackCode 
	include Friendly::Document

	attribute :user_id, Integer	
	attribute :code, String
	attribute :percentage, Float

	indexes :user_id
	indexes :code

	def trackbacks
		Trackback.all( :trackback_code_id => self.id )
	end
end
