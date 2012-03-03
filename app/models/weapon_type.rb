class WeaponType < ActiveRecord::Base
  attr_accessible :type_name, :type_description
  has_many  :weapons
end

# == Schema Information
#
# Table name: weapon_types
#
#  id               :integer         not null, primary key
#  type_name        :string(255)
#  type_description :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

