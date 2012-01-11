class WeaponsController < ApplicationController
  before_filter :authenticate, :only => [:create, :update, :destroy]
    
  def new
    @title = "Add Weapon"
    @user = current_user
    @weapon = Weapon.new
  end
  
  def create
    @user = current_user
    @weapon  = current_user.weapons.build(params[:weapon])
    if @weapon.save
      flash[:success] = "Weapon Created!"
      redirect_to weapons_path
    else
      render 'new'
    end
  end

  def show
    @title = "Weapon Page"
    @weapon = Weapon.find(params[:id])
  end

  def edit
    @title = "Edit Weapon"
    @user = current_user
    @weapon = Weapon.find(params[:id])
  end
  
  def update
    @user = current_user
    @weapon  = Weapon.update(params[:id], params[:weapon])
    if @weapon.update_attributes(params[:weapon])
      flash[:success] = "Weapon Updated!"
      render 'show'
    else
      render 'edit'
    end
  end

  def index
    @title = "Weapon Inventory"
    @user = current_user
    @weapons = Weapon.paginate(:per_page => 10, :page => params[:page])
  end
  
  def destroy
    @weapon = Weapon.destroy(params[:id])
    redirect_to weapons_path, :flash => { :success => "weapon deleted"}
  end

end
