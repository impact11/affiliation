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

# Roles
admin_role = Role.create( :title => "admin" )

# Users
admin = User.new( :login => "admin", :password => "testpass", :password_confirmation => "testpass", :email => "administrator@example.com", :approved_at => DateTime.now, :activated_at => DateTime.now )
admin.roles << admin_role
admin.save

admin.activate!

# Affiliates
affiliate1 = Affiliate.create( :login => "approved_affiliate", :password => "testpass", :password_confirmation => "testpass", :email => "affiliate1@example.com", :approved_at => DateTime.now, :activated_at => DateTime.now )
affiliate2 = Affiliate.create( :login => "unapproved_affiliate", :password => "testpass", :password_confirmation => "testpass", :email => "affiliate2@example.com" )
affiliate3 = Affiliate.create( :login => "unactivated_affiliate", :password => "testpass", :password_confirmation => "testpass", :email => "affiliate3@example.com", :approved_at => DateTime.now )

# Affiliate codes
TrackbackCode.create( :user_id => affiliate1.id, :name => "affcode1", :percentage => 10.0)
