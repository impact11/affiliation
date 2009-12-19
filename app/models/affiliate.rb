class Affiliate < User
	def trackback_codes
		TrackbackCode.all( :user_id => self.id )
	end

	def approved?
		return self.approved_at ? true : false
	end

	def approve!
		self.approved_at = DateTime.now
		self.save
	end
end
