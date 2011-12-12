class WeaponsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
    
  def new
  end
  
  def create
    @weapon  = current_user.weapons.build(params[:weapon])
    if @weapon.save
      flash[:success] = "Weapon created!"
      redirect_to root_path
    else
      render 'pages/home'
    end
  end

  def show
  end

  def edit
  end

  def index
    @title = "Weapon Inventory"
    @user = current_user
    @weapons = Weapon.paginate(:per_page => 10, :page => params[:page])
  end

end
