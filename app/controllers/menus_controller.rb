class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  def big
    @restaurant = Restaurant.find(params[:id])
    @menus = @restaurant.menus.all
    render :layout => false
  end

  def small
    render :layout => false
  end

  # GET /menus
  # GET /menus.json
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menus = @restaurant.menus.all
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
  end

  # GET /menus/new
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = Menu.new
  end

  # POST /menus
  # POST /menus.json
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = Menu.new(menu_params)
    @menu.widget = @restaurant.menu_widget
    respond_to do |format|
      if @menu.save
        format.html { redirect_to @restaurant, notice: 'Menu was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu.destroy
    respond_to do |format|
      format.html { redirect_to @restaurant, notice: 'Menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:widget_id, :image)
    end
end
