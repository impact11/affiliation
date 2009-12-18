require 'test_helper'

class TrackbackCodeTest < ActiveSupport::TestCase
	test "create trackback code" do
		TrackbackCode.create( 
				:user_id => 1,
				:code => "affcode1",
				:percentage => 10.0
			) 
		
		puts TrackbackCode.first( :code => "affcode1" ).inspect
	end
end
