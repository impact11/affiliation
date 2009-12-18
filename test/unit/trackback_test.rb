require 'test_helper'

class TrackbackTest < ActiveSupport::TestCase
	test "create trackback" do
		Trackback.create( 
				:trackback_code_id => 1, 
				:ip_address => "10.0.0.2", 
				:origin => "development.musichristian.com", 
				:action => "NEW",
				:viewed => ""
			) 
		
		puts Trackback.all( :action => "NEW" ).inspect
	end
end
