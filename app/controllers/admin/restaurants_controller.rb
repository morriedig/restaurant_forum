class Admin::RestaurantsController < Admin::BaseController
  before_action :find_restaurant, only: [:show, :edit, :destroy, :update]

  def index
    @restaurants = Restaurant.page(params[:page]).per(10)
  end

  def show
    
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
    
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to admin_restaurant_path(@restaurant)
      flash[:notice] = "restaurant was successfully updated"
    else
      render :edit
      flash[:alert] = "restaurant was failed to update"
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to admin_restaurants_path
    flash[:alert] = "restaurant was deleted"
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
    params.require(:restaurant).permit(:category_id, :name, :opening_hours, :tel, :address, :description, :image)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end
