class UsersController < ApplicationController
  def new
    @title = "Sign up"
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to the Weapons App!"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end

  def edit
  end

  def index
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name    
  end

end
