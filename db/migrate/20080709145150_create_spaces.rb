class CreateSpaces < ActiveRecord::Migration
  def self.up
    create_table :spaces do |t|
      t.string :name
      t.string :description
      t.string :space_type
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt

      t.timestamps
    end
  end

  def self.down
    drop_table :spaces
  end
end
