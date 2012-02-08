class Gunpic < ActiveRecord::Base
  attr_accessible :weapon_photo ,
                  :photo_name   ,
                  :weapon_id      
  belongs_to :weapon
  
  mount_uploader :weapon_photo, ImageUploader   
  
  validates :photo_name,       :allow_blank     => true,
                                :length       => { :maximum => 50 }                                    
end

# == Schema Information
#
# Table name: gunpics
#
#  id           :integer         not null, primary key
#  weapon_photo :string(255)
#  photo_name   :string(255)
#  weapon_id    :integer
#  created_at   :datetime
#  updated_at   :datetime
#

