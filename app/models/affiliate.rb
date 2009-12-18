class Affiliate < User
	def trackback_codes
		TrackbackCode.all( :user_id => self.id )
	end
end
