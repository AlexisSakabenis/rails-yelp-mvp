class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    puts "========== Parameters: #{params.inspect} =========="
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path(@restaurant), status: :see_other
    else
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
