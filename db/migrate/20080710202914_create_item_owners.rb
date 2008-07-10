class CreateItemOwners < ActiveRecord::Migration
  def self.up
    create_table :item_owners do |t|
      t.integer :item_reference_id
      t.integer :user_id
      t.integer :version

      t.timestamps
    end
  end

  def self.down
    drop_table :item_owners
  end
end
