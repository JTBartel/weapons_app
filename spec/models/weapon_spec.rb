require 'spec_helper'

describe Weapon do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: weapons
#
#  id                   :integer         not null, primary key
#  weapon_type          :string(255)
#  weapon_name          :string(255)
#  weapon_nickname      :string(255)
#  weapon_action        :string(255)
#  weapon_image         :string(255)
#  caliber              :integer
#  caliber_unit         :string(255)
#  round_cap            :integer
#  rate_of_fire         :integer
#  rof_unit             :string(255)
#  max_range            :integer
#  max_range_unit       :string(255)
#  effective_range      :integer
#  effective_range_unit :string(255)
#  origin_country       :string(255)
#  year_made            :integer
#  user_id              :integer
#  created_at           :datetime
#  updated_at           :datetime
#

