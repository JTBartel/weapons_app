require 'spec_helper'

describe PagesController do
  render_views

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
  end
  it "should have the right title" do
    get 'home'
    response.should have_selector("title",
                      :content => "Weapons Book | Home")
  end
  

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
  end
  it "should have the right title" do
    get 'contact'
    response.should have_selector("title",
                      :content => "Weapons Book | Contact")
  end

  describe "GET 'help'" do
    it "should be successful" do
      get 'help'
      response.should be_success
    end
  end
  it "should have the right title" do
    get 'help'
    response.should have_selector("title",
                      :content => "Weapons Book | Help")
  end

  describe "GET 'advertising'" do
    it "should be successful" do
      get 'advertising'
      response.should be_success
    end
  end
  it "should have the right title" do
    get 'advertising'
    response.should have_selector("title",
                      :content => "Weapons Book | Advertising")
  end

  describe "GET 'privacy'" do
    it "should be successful" do
      get 'privacy'
      response.should be_success
    end
  end
  it "should have the right title" do
    get 'privacy'
    response.should have_selector("title",
                      :content => "Weapons Book | Privacy")
  end
  
  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
  end
  it "should have the right title" do
    get 'about'
    response.should have_selector("title",
                      :content => "Weapons Book | About")
  end
  
  describe "GET 'testimonies'" do
    it "should be successful" do
      get 'testimonies'
      response.should be_success
    end
  end
  it "should have the right title" do
    get 'testimonies'
    response.should have_selector("title",
                      :content => "Weapons Book | Testimonies")
  end

end
