class CreateAffiliates < ActiveRecord::Migration
  def self.up
    create_table :affiliates do |t|
			t.string :email_address
			t.string :login
			t.string :hashed_password
			t.string :address
			t.string :city
			t.string :state
			t.string :zip_code
			t.string :country
			t.string :phone
			t.string :taxid
      t.timestamps
    end
  end

  def self.down
    drop_table :affiliates
  end
end
