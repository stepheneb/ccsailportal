class NonArItems < ActiveRecord::Migration
  def self.up
    create_table :non_ar_items do |t|
      t.string  :type
      t.integer :owners_version
      t.integer :offering_id
      t.integer :item_service_id
      t.string  :config

      t.timestamps
    end
  end

  def self.down
    drop_table :non_ar_items
  end
end
