require 'aasm'

class PayableAction < ActiveRecord::Base
	include AASM # Include ActsAsStateMachine methods

	belongs_to :user
	before_create :calculate_payout

	aasm_column :state

	aasm_initial_state :pending

	aasm_state :pending
	aasm_state :approved
	aasm_state :paid
	aasm_state :denied

	def trackback_code
		TrackbackCode.first( :name => self.trackback_code_name ) if self.trackback_code_name
	end
	
	def trackback
		Trackback.first( :session_id => self.trackback_id ) if self.trackback_id
	end

	def calculate_payout
		self.payout = self.order_amount * ( self.trackback_code.percentage	* 0.01 )
	end

	def approve!(user_id = nil)
		self.approved_by = user_id
		self.approved_at = DateTime.now
		self.state = "approved"
		self.save
	end

	def pay!(user_id = nil)
		self.paid_by = user_id
		self.paid_at = DateTime.now
		self.state = "paid"
		self.save
	end

	def deny!(user_id = nil)
		self.state = "denied"
		self.save
	end
end
