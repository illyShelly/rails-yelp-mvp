class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show, :edit, :update, :destroy]
  # column after 'only'

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
    # before_action
  end

  # find by id and just render prefilled form
  def edit
    # before_action
  end

  def update
    # before_action
    # safe type of params
    @restaurant.update(restaurant_params)
    # after save redirect to check if ok
    redirect_to restaurant_path(@restaurant)
  end
  def destroy
    # before_action
    @restaurant.destroy
    redirect_to restaurants_path # to all restaurants
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

   def restaurant_params
      params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

end
