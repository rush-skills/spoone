class API::RestaurantsController < API::ApplicationController
  # before_action :authenticate_user!
  respond_to :json
  before_action :set_restaurant, only: [:show]

  def show

  end

  def nearby
    lat = params["lat"]
    lng = params["lon"]
    @restaurant = Restaurant.closest(origin: [lat,lng]).first
    @widgets = @restaurant.widgets
    render 'nearby'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

end
