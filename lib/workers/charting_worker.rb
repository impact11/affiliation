class ChartingWorker < BackgrounDRb::MetaWorker
  set_worker_name :charting_worker
  def create(args = nil)
    # this method is called, when worker is loaded for the first time
  end

	def traffic_previous_thirty_days
		traffic = Gruff::Line.new
		traffic.title = "Traffic for the last 30 days"

		thirty_days_ago = DateTime.now - 30.days

		traffic.data("Click-throughs", Trackback.find(:all, :conditions => ["action = ? AND created_at >= ?", "CLICK_THROUGH", thirty_days_ago ) 
		traffic.data("Page views", Trackback.find(:all, :conditions => ["action = ? AND created_at >= ?", "VIEW", thirty_days_ago )
		traffic.data("Orders", Trackback.find(:all, :conditions => ["action = ? AND created_at >= ?", "ORDER", thirty_days_ago )
	end
end

