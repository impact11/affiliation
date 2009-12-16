class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
			t.integer :user_id
			t.string :street_address_1
			t.string :street_address_2
			t.string :city
			t.string :state
			t.string :zip_code
			t.string :country
      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
