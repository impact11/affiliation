class CreateTrackbackCodes < ActiveRecord::Migration
  def self.up
    create_table :trackback_codes do |t|
			t.integer :user_id
			t.string :code
			t.float :percentage, :scale => 5, :precision => 5
      t.timestamps
    end
  end

  def self.down
    drop_table :trackback_codes
  end
end
