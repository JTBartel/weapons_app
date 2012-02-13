class UsersController < ApplicationController
  # brand new person can create himself, but he has to be an authenticated, existing user to edit/update himself.
  before_filter :authenticate, :only => [:edit, :update]
  before_filter :correct_user, :only => [:edit, :update]
  # only an admin user can delete a user.
  before_filter :admin_user,   :only => :destroy
  helper_method :sort_column, :sort_direction
  
  def new
    if current_user
      redirect_to(root_path)
    else
      @title = "Sign up"
      @user = User.new
    end
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Weapons App!"
      redirect_to @user
    else
      @title = "Sign up"
      @user.password = ""
      @user.password_confirmation = ""
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    @title = "Edit user"
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end
  

  def index
    @title = "All users"
    @users = User.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name    
  end
  
  def destroy
    User.destroy(params[:id])
    flash[:success] = "User destroyed."
    redirect_to users_path
  end
  
  private

    def authenticate
      deny_access unless signed_in?
    end
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
    
    def sort_column
      User.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
