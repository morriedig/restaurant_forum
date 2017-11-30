class Admit::RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admit
  before_action :find_restaurant, only: [:show, :edit, :delete]

  def index
    
  end

  def show
    
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = "restaurant was successfully created"
      redirect_to admin_restaurants_path
    else
      flash.now[:alert] = "restaurant was failed to create"
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :opening_hours, :tel, :address, :description)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end
