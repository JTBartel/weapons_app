require 'spec_helper'

describe PagesController do
  render_views

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
  end

  describe "GET 'help'" do
    it "should be successful" do
      get 'help'
      response.should be_success
    end
  end

  describe "GET 'advertising'" do
    it "should be successful" do
      get 'advertising'
      response.should be_success
    end
  end

  describe "GET 'privacy'" do
    it "should be successful" do
      get 'privacy'
      response.should be_success
    end
  end
  
  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
  end
  
  describe "GET 'testimonies'" do
    it "should be successful" do
      get 'testimonies'
      response.should be_success
    end
  end

end
