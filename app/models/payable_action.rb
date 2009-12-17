class PayableAction < ActiveRecord::Base
	belongs_to :user
	belongs_to :trackback
end
