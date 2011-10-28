require 'spec_helper'

describe UsersController do
  render_views
  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
    it "should have the right title" do
       get 'new'
       response.should have_selector("title", :content => "Sign up")
    end
  end

  #describe "GET 'edit'" do
  #  it "should be successful" do
  #    get 'edit'
  #    response.should be_success
  #  end
  #end

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  #describe "GET 'show'" do
  #  it "should be successful" do
  #    get 'show'
  #    response.should be_success
  #  end
  #end

end
