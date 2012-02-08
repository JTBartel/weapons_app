class CreateGunpics < ActiveRecord::Migration
  def self.up
    create_table  :gunpics do |t|
      t.string    :weapon_photo
      t.string    :photo_name
      t.integer   :weapon_id

      t.timestamps
    end
    add_index :gunpics, :weapon_id
  end

  def self.down
    drop_table :gunpics
    remove_index :gunpics, :weapon_id
  end
end
