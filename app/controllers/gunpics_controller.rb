class GunpicsController < ApplicationController
  before_filter :authenticate, :only => [:create, :update, :destroy]
    
  def new
    @title = "Add Gunpic"
    @user = current_user
    @weapons = @user.weapons
    @gunpic = Gunpic.new
  end
  
  def create
    @user = current_user
    @gunpic  = current_user.gunpics.build(params[:gunpic])
    if @gunpic.save
      flash[:success] = "Gunpic Created!"
      redirect_to gunpics_path
    else
      render 'new'
    end
  end

  def show
    @title = "Gunpic Page"
    @gunpic = Gunpic.find(params[:id])
  end

  def edit
    @title = "Edit Gunpic"
    @user = current_user
    @gunpic = Gunpic.find(params[:id])
  end
  
  def update
    @user = current_user
    @gunpic  = Gunpic.update(params[:id], params[:gunpic])
    if @gunpic.update_attributes(params[:gunpic])
      flash[:success] = "Gunpic Updated!"
      render 'show'
    else
      render 'edit'
    end
  end

  def index
    @title = "Gunpic Inventory"
    @user = current_user
    @weapons = @user.weapons
    @gunpics = Gunpic.paginate(:per_page => 10, :page => params[:page])
  end
  
  def destroy
    @gunpic = Gunpic.destroy(params[:id])
    redirect_to gunpics_path, :flash => { :success => "gunpic deleted"}
  end

end
