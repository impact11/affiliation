require 'aasm'

class PayableAction < ActiveRecord::Base
	include AASM # Include ActsAsStateMachine methods

	attr_accessor :current_history

	belongs_to :affiliate, :foreign_key => :user_id

	before_create :calculate_payout

	aasm_column :state

	aasm_initial_state :pending

	aasm_state :pending
	aasm_state :approved
	aasm_state :paid
	aasm_state :denied

	# Initialization callback to preserve initial history
	def after_initialize
		self.current_history = History.new( :parent_class => self.class.name, :parent_id => self.id, :state_in => self.state )
	end

	def after_save
		self.current_history.state_out = self.state
		self.current_history.save
	end

	def histories
		History.find(:all, :conditions => [ "parent_class = ? AND parent_id = ?", self.class.name, self.id ])
	end

	def trackback_code
		TrackbackCode.first( :name => self.trackback_code_name ) if self.trackback_code_name
	end
	
	def trackback
		Trackback.first( :session_id => self.trackback_id ) if self.trackback_id
	end

	def calculate_payout
		self.payout = self.order_amount * ( self.trackback_code.percentage	* 0.01 )
	end

	# State change & history methods

	def approve!(user = nil, options = {})
		self.current_history.user_id = user.id
		self.current_history.notes = "Approved by #{user.login}\n#{options[:notes]}" 
		self.state = "approved"
		self.save
	end

	def pay!(user = nil, options = {})
		self.current_history.user_id = user.id
		self.current_history.notes = "Paid by #{user.login}\n#{options[:notes]}" 
		self.state = "paid"
		self.save
	end

	def deny!(user = nil, options = {})
		self.current_history.user_id = user.id
		self.current_history.notes = "Denied by #{user.login}\n#{options[:notes]}" 
		self.state = "denied"
		self.save
	end

	def revert!(user_id = nil)
		self.save
	end
end
