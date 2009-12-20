class Affiliate < User
	has_many :orders, :foreign_key => :user_id

	def trackback_codes
		TrackbackCode.all( :user_id => self.id )
	end

	def trackbacks
		tb = [] 
		self.trackback_codes.each do |code|
			tb = tb | code.trackbacks
		end
		tb
	end

	# Mmmm pure sugar!
	def member_status
		num = self.orders.size
		rank = case num 
			when 0..2 then 1
			when 3..9 then 2
			when 10..50 then 3
			when 51..200 then 4
			when 201..500 then 5
			when 501..1000 then 6
			# and so on
		end	 
		rank
	end

	def approved?
		return self.approved_at ? true : false
	end

	def approve!
		self.approved_at = DateTime.now
		self.save(false)
	end
end
