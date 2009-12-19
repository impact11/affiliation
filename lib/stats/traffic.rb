module Stats
class Traffic < Stats::Base
	attr_accessor :orders, :trackbacks, :data_sets, :days, :min, :max

	def create
		self.data_sets = []
		self.days = []
		self.max = 0
		self.min = 0

		self.trackbacks = Trackback.all( :default => Trackback::DEFAULT ).select{|t| t.created_at >= start_date }
		trackback_data = []

		self.orders = Order.find(:all, :conditions => ["created_at >= ?", start_date])
		order_data = []

		page_view_data = []

		# Sort by day within 30 day period
		self.start_date.upto(self.end_date) do |date|
			day = date.beginning_of_day
			
			# Trackbacks
			track_count = 0
			page_count = 0
			self.trackbacks.each do |trackback|
				if time_compare( day, trackback.created_at )
					track_count += 1
					page_count += trackback.page_views.size
				end
			end
			trackback_data << track_count
			page_view_data << page_count

			# Orders
			order_data << self.orders.select {|o| time_compare(day, o.created_at) }.size

			# Add even days
			self.days << date.strftime("%m/%d") if date.day % 2 == 0
		end

		self.data_sets << page_view_data 
		self.data_sets << trackback_data
		self.data_sets << order_data

		# Get min and max
		self.data_sets.each do |data_set|
			self.max = data_set.max.nil? || data_set.max < self.max ? self.max : data_set.max	
			#self.min = data_set.min.nil? || data_set.max < self.max ? self.min : data_set.min
		end
	end

	def range
		range = []
		self.min.upto(max) do |i|
			range << i if i % 2 == 0
		end
		range
	end

	def time_compare(a, b)
		return a.strftime("%Y%m%d") == b.strftime("%Y%m%d")
	end
end
end
