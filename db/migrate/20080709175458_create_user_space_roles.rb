class CreateUserSpaceRoles < ActiveRecord::Migration
  def self.up
    create_table :user_space_roles do |t|
      t.integer :user_id
      t.integer :space_role_id

      t.timestamps
    end
  end

  def self.down
    drop_table :user_space_roles
  end
end
