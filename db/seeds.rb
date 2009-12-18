# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)


# Create Friendly tables
Trackback
TrackbackCode
PageView

Friendly.create_tables!

# Users
admin = User.new( :login => "admin", :password => "testpass", :password_confirmation => "testpass", :email => "administrator@example.com" )
admin.save

# Affiliates
affiliate = Affiliate.new( :login => "affiliate1", :password => "testpass", :password_confirmation => "testpass", :email => "affiliate1@example.com" )
affiliate.save

# Affiliate codes
TrackbackCode.create( :user_id => affiliate.id, :name => "affcode1", :percentage => 10.0)
