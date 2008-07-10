class CreateItemReferences < ActiveRecord::Migration
  def self.up
    create_table :item_references do |t|
      t.integer :item_service_id
      t.integer :owners_version
      t.string :item_id

      t.timestamps
    end
  end

  def self.down
    drop_table :item_references
  end
end
