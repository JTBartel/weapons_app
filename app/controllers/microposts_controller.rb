class MicropostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  
  def index
  end
  
  def new
  end

  def create
    @user = current_user
    @micropost = @user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to user_path(@user)
    else
      render user_path(@user)
    end
  end

  def destroy
  end
end
