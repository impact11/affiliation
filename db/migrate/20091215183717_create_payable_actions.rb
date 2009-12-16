class CreatePayableActions < ActiveRecord::Migration
  def self.up
    create_table :payable_actions do |t|
			t.integer :user_id
			t.string  :action
			t.integer :origin_id
			t.integer :order_id
			t.integer :order_total
			t.integer :trackback_code_id
			t.boolean :is_approved
      t.timestamps
    end
  end

  def self.down
    drop_table :payable_actions
  end
end
