class PayableAction < ActiveRecord::Base
	belongs_to :user
	
	before_create :calculate_payout

	def trackback_code
		TrackbackCode.first( :name => self.trackback_code_name ) if self.trackback_code_name
	end
	
	def trackback
		Trackback.first( :session_id => self.trackback_id ) if self.trackback_id
	end

	def calculate_payout
		self.payout = self.order_amount * ( self.trackback_code.percentage	* 0.01 )
	end

	def approved?
		if self.approved_at
			return true
		end
		false
	end

	def approve!(user_id = nil)
		self.approved_by = user_id
		self.approved_at = DateTime.now
		self.save
	end
end
