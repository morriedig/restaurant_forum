class RestaurantsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    
  end

  def show
    
  end

  def new
    
  end

  def edit
    
  end

  def delete
    
  end

  private

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
