class CreateWeaponTypes < ActiveRecord::Migration
  def self.up
    create_table :weapon_types do |t|
      t.string :type_name
      t.string :type_description

      t.timestamps
    end
  end

  def self.down
    drop_table :weapon_types
  end
end
