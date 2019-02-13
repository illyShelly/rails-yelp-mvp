class Admin::RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    # not have signin using current_user
  end
end

# run by rails g controller admin/restaurans
# in view admin/restaurants/ create -> index.html.erb
