class CreateItemServices < ActiveRecord::Migration
  def self.up
    create_table :item_services do |t|
      t.string :type
      t.string :config

      t.timestamps
    end
  end

  def self.down
    drop_table :item_services
  end
end
