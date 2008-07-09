class CreateSpaceRoles < ActiveRecord::Migration
  def self.up
    create_table :space_roles do |t|
      t.string :name
      t.integer :space_id

      t.timestamps
    end
  end

  def self.down
    drop_table :space_roles
  end
end
