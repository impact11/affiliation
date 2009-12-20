class CreateHistories < ActiveRecord::Migration
  def self.up
    create_table :histories do |t|
			t.string 	:parent_class
			t.integer :parent_id
			t.integer :user_id
			t.string	:state_in
			t.string	:state_out
			t.text		:notes
      t.timestamps
    end
  end

  def self.down
    drop_table :payable_action_histories
  end
end
