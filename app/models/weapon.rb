class Weapon < ActiveRecord::Base
  attr_accessible :weapon_type          ,
                  :weapon_name          ,
                  :weapon_nickname      ,
                  :weapon_action        ,
                  :weapon_image         ,
                  :caliber              ,
                  :caliber_unit         ,
                  :round_cap            ,
                  :rate_of_fire         ,
                  :rof_unit             ,
                  :max_range            ,
                  :max_range_unit       ,
                  :effective_range      ,
                  :effective_range_unit ,
                  :origin_country       ,
                  :year_made
  belongs_to :user
  has_many   :gunpics
  
  mount_uploader :weapon_image, ImageUploader   
  
  validates :weapon_name,       :presence     => true,
                                :length       => { :maximum => 50 }                                    
  validates :weapon_type,       :presence     => true,
                                :length       => { :maximum => 50 }
  validates :user_id,           :presence     => true,
                                :length       => { :maximum => 150 }                                                                               
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
#  caliber              :string(255)
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
#  weapon_approval      :boolean         default(FALSE)
#  submit_name          :boolean         default(FALSE)
#  user_id              :integer
#  created_at           :datetime
#  updated_at           :datetime
#

