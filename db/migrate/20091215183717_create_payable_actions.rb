class CreatePayableActions < ActiveRecord::Migration
  def self.up
    create_table :payable_actions do |t|
			t.string 	:type
			t.integer :user_id
			t.string  :trackback_code_name
			t.string  :trackback_id
			t.string  :order_number
			t.float   :order_amount, :scale => 10, :precision => 2
			t.float   :payout, :scale => 10, :precision => 2
			t.boolean :approved_at
			t.integer :approved_by
      t.timestamps
    end
  end

  def self.down
    drop_table :payable_actions
  end
end
