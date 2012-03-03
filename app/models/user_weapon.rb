class UserWeapon < ActiveRecord::Base
  belongs_to :user
  belongs_to :weapon
end

# == Schema Information
#
# Table name: user_weapons
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  weapon_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

