class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  # form
  def new
    @restaurant = Restaurant.new
  end

  def create
    # info from form in params
    @restaurant = Restaurant.new(restaurant_params)
    # if not validate all -> do not redirect (let refilled fields)
    if @restaurant.save
      # redirect_to restaurant_path(@restaurant)
      redirect_to restaurants_path
    else
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  # find by id and just render prefilled form
  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    # safe type of params
    @restaurant.update(restaurant_params)
    # after save redirect to check if ok
    redirect_to restaurant_path(@restaurant)
  end
  def destroy

  end

  private

   def restaurant_params
      params.require(:restaurant).permit(:name, :address, :phone_number, :category)
    end
end
