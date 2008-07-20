class CreateOfferings < ActiveRecord::Migration
  def self.up
    create_table :offerings do |t|
      t.integer :space_id
      t.integer :item_id
      t.string  :item_type
      t.string  :child_item_type

      t.timestamps
    end
  end

  def self.down
    drop_table :offerings
  end
end
