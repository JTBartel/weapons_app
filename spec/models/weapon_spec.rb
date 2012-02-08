require 'spec_helper'

describe Weapon do

  before(:each) do
    @user = Factory(:user)
    @attr = { :weapon_type  => "Rifle"        ,                  
              :weapon_name  => "M1 Garand"    ,
              :user_id      => @user.id       }
  end

  it "should create a new weapon given valid attributes" do
    @user.weapons.create!(@attr)
  end

  describe "user associations" do

    before(:each) do
      @weapon = @user.weapons.create(@attr)
    end

    it "should have a user attribute" do
      @weapon.should respond_to(:user)
    end

    it "should have the right associated user" do
      @weapon.user_id.should == @user.id
      @weapon.user.should == @user
    end
  end
  
  describe "validations" do

    it "should require a user id" do
      Weapon.new(@attr).should_not be_valid
    end

    it "should require nonblank name" do
      @user.weapons.build(:weapon_name => "  ").should_not be_valid
    end
    
    it "should require nonblank type" do
      @user.weapons.build(:weapon_type => "  ").should_not be_valid
    end

    it "should reject long name" do
      @user.weapons.build(:weapon_name => "a" * 51).should_not be_valid
    end
    
    it "should reject long type" do
      @user.weapons.build(:weapon_type => "a" * 51).should_not be_valid
    end
  end
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

