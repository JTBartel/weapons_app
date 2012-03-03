class CreateUserWeapons < ActiveRecord::Migration
  def self.up
    create_table :user_weapons do |t|
      t.integer :user_id
      t.integer :weapon_id

      t.timestamps
    end
    add_index   :user_weapons,  :user_id
    add_index   :user_weapons,  :weapon_id
  end

  def self.down
    drop_table :user_weapons
    remove_index   :user_weapons,  :user_id
    remove_index   :user_weapons,  :weapon_id
  end
end
