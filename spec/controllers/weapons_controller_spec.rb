require 'spec_helper'

describe WeaponsController do
  render_views
  
  describe "access control" do

    it "should deny access to 'create'" do
      post :create
      response.should redirect_to(signin_path)
    end

    it "should deny access to 'destroy'" do
      delete :destroy, :id => 1
      response.should redirect_to(signin_path)
    end
  end
  describe "POST 'create'" do

    before(:each) do
      @user = test_sign_in(Factory(:user))
    end

    describe "failure" do

      before(:each) do
        @attr = { :weapon_type  => "" }
      end

      it "should not create a weapon" do
        lambda do
          post :create, :weapon => @attr
        end.should_not change(Weapon, :count)
      end

      it "should render the home page" do
        post :create, :weapon => @attr
        response.should render_template('pages/home')
      end
    end

    describe "success" do

      before(:each) do
        @attr = { :weapon_type  => "Rifle"        ,                  
                  :weapon_name  => "M1 Garand"    ,
                  :user_id      => @user.id }
      end

      it "should create a weapon" do
        lambda do
          post :create, :weapon => @attr
        end.should change(Weapon, :count).by(1)
      end

      it "should redirect to the home page" do
        post :create, :weapon => @attr
        response.should redirect_to(root_path)
      end

      it "should have a flash message" do
        post :create, :weapon => @attr
        flash[:success].should =~ /weapon created/i
      end
    end
  end
end
