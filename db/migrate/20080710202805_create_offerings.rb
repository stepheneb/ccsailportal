class CreateOfferings < ActiveRecord::Migration
  def self.up
    create_table :offerings do |t|
      t.integer :space_id
      t.integer :item_reference_id

      t.timestamps
    end
  end

  def self.down
    drop_table :offerings
  end
end
