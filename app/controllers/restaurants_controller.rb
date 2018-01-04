class RestaurantsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:search]
      @restaurants = Restaurant.named(params[:search]).page(params[:page]).per(9)
    else
      @restaurants = Restaurant.all.page(params[:page]).per(9)
    end
      @categories = Category.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @comment = Comment.new
  end

  def feeds
    @recent_restaurants = Restaurant.order(created_at: :desc).limit(10)
    @recent_comments = Comment.order(created_at: :desc).limit(10)
  end

  def dashboard
    find_restaurant
  end

  def favorite
    find_restaurant
    if current_user.favorite?(@restaurant)
      @favorite = Favorite.where(user: current_user, restaurant: @restaurant)
      @favorite.destroy_all
    elsif
      @favorite = current_user.favorites.create(restaurant: @restaurant)
    end
  end

  # def unfavorite
  #   @restaurant = Restaurant.includes(:favorites).find(params[:id])
  #   @favorite = @restaurant.favorites.where(user: current_user)
  #   @favorite.destroy_all
  # end


  def new
    
  end

  def edit
    
  end

  def delete
    
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name)
  end

  def authenticate_admit
    unless current_user.admit?
      flash[:alert] = "Not allow!"
      redirect_to root_path
    end
  end

end
