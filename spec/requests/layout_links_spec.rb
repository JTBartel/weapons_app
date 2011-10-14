require 'spec_helper'

describe "LayoutLinks" do
  describe "GET /layout_links" do
    it "should have a Home page at '/'" do
      get '/'
      response.should have_selector('title', :content => "Home")
    end
    
    it "should have an About page at '/about'" do
      get '/about'
      response.should have_selector('title', :content => "About")
    end
    
    it "should have an Advertising page at '/advertising'" do
      get '/advertising'
      response.should have_selector('title', :content => "Advertising")
    end

    it "should have a Contact page at '/contact'" do
      get '/contact'
      response.should have_selector('title', :content => "Contact")
    end

    it "should have a Help page at '/help'" do
      get '/help'
      response.should have_selector('title', :content => "Help")
    end
    
    it "should have an Privacy page at '/privacy'" do
      get '/privacy'
      response.should have_selector('title', :content => "Privacy")
    end
    
    it "should have an Testimonies page at '/testimonies'" do
      get '/testimonies'
      response.should have_selector('title', :content => "Testimonies")
    end
    it "should have a signup page at '/signup'" do
      get '/signup'
      response.should have_selector('title', :content => "Sign up")
    end
  end
end