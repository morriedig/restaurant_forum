class Admit::RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admit

end
