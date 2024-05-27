class RestaurantsController < ApplicationController

def index
  @restaurants = Restaurant.all
end

def new
  @restaurant = Restaurant.new
end

def create
  @restaurant = Restaurant.new(rest_params)
  @restaurant.save

  if @restaurant.save
    redirect_to restaurant_path(@restaurant)
  else
    render :new, status: :unprocessable_entity
  end
end

def show
  @restaurant = Restaurant.find(params[:id])
end

def update
  @restaurant = Restaurant.find(params[:id])
  @restaurant.update(rest_params)

  redirect_to restaurants_path
end

private

def rest_params
  params.require(:restaurant).permit(:name, :address, :phone_number, :category)
end

end
