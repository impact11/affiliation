class CreatePayableActions < ActiveRecord::Migration
  def self.up
    create_table :payable_actions do |t|
			t.integer :user_id
			t.integer :trackback_id
			t.float   :payout, :scale => 10, :precision => 2
			t.boolean :is_approved
      t.timestamps
    end
  end

  def self.down
    drop_table :payable_actions
  end
end
