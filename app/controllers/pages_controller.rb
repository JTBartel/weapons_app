class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def contact
    @title = "Contact"
  end

  def help
    @title = "Help"
  end

  def advertising
    @title = "Advertising"
  end

  def privacy
    @title = "Privacy"
  end

  def testimonies
    @title = "Testimonies"
  end
  
  def about
    @title = "About"
  end

end
