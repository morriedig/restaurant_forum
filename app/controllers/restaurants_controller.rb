class RestaurantsController < ApplicationController
  before_action :authenticate!, except: [:index, :show]

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

end
