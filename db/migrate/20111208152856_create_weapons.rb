class CreateWeapons < ActiveRecord::Migration
  def self.up
    create_table  :weapons do |t|
      t.string    :weapon_type
      t.string    :weapon_name
      t.string    :weapon_nickname
      t.string    :weapon_action
      t.string    :weapon_image
      t.string    :caliber
      t.string    :caliber_unit
      t.integer   :round_cap
      t.integer   :rate_of_fire
      t.string    :rof_unit
      t.integer   :max_range
      t.string    :max_range_unit
      t.integer   :effective_range
      t.string    :effective_range_unit
      t.string    :origin_country
      t.integer   :year_made
      t.boolean   :weapon_approval  , :default => false
      t.boolean   :submit_name      , :default => false
      t.integer   :user_id

      t.timestamps
    end
    add_index :weapons, :user_id
  end

  def self.down
    drop_table :weapons
    remove_index :weapons, :user_id    
  end
end
