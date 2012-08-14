class UsersController < ApplicationController
  # brand new person can create himself, but he has to be an authenticated, existing user to edit/update himself.
  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :authenticate  , :only => [:edit, :update]
  before_filter :correct_user  , :only => [:edit, :update]
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
    @weapons = Weapon.all
    @rifle = WeaponType.where(:type_name => "Rifle").first
    @smg = WeaponType.where(:type_name => "Sub Machine Gun").first
    @lmg = WeaponType.where(:type_name => "Light Machine Gun").first
    @sniper = WeaponType.where(:type_name => "Sniper Rifle").first
    @handgun = WeaponType.where(:type_name => "Hand Gun").first
    @launcher = WeaponType.where(:type_name => "Launcher").first
    @shotgun = WeaponType.where(:type_name => "Shot Gun").first
    @armor = WeaponType.where(:type_name => "Armor").first
    @sword = WeaponType.where(:type_name => "Sword").first
    @bow = WeaponType.where(:type_name => "Bow").first
    @spear = WeaponType.where(:type_name => "Spear").first
    @tank = WeaponType.where(:type_name => "Tank").first
    @ship = WeaponType.where(:type_name => "Ship").first
    @aircraft = WeaponType.where(:type_name => "Aircraft").first
    @shields = WeaponType.where(:type_name => "Shields").first
    @other = WeaponType.where(:type_name => "Other").first
#--------------------------------------------------------------------------    
    @rifles = Weapon.where(:weapon_type_id => @rifle).order("weapon_name")
    @smgs = Weapon.where(:weapon_type_id => @smg).order("weapon_name")
    @lmgs = Weapon.where(:weapon_type_id => @lmg).order("weapon_name")
    @snipers = Weapon.where(:weapon_type_id => @sniper).order("weapon_name")
    @handguns = Weapon.where(:weapon_type_id => @handgun).order("weapon_name")
    @launchers = Weapon.where(:weapon_type_id => @launcher).order("weapon_name")
    @shotguns = Weapon.where(:weapon_type_id => @shotgun).order("weapon_name")
    @armors = Weapon.where(:weapon_type_id => @armor).order("weapon_name")
    @swords = Weapon.where(:weapon_type_id => @sword).order("weapon_name")
    @bows = Weapon.where(:weapon_type_id => @bow).order("weapon_name")
    @spears = Weapon.where(:weapon_type_id => @spear).order("weapon_name")
    @tanks = Weapon.where(:weapon_type_id => @tank).order("weapon_name")
    @ships = Weapon.where(:weapon_type_id => @ship).order("weapon_name")
    @aircrafts = Weapon.where(:weapon_type_id => @aircraft).order("weapon_name")
    @shields = Weapon.where(:weapon_type_id => @shields).order("weapon_name")
    @others = Weapon.where(:weapon_type_id => @other).order("weapon_name")
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
    @micropost = @user.microposts.new
    @microposts = @user.microposts.paginate(:per_page => 8, page: params[:page])   
    @title = @user.name 
    @weapons = @user.weapons 
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
