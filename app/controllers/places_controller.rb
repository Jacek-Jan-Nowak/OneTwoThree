class PlacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_user
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  def index
    @places = Place.all
  end

  def show
  end

  def edit
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(strong_params)
    @place.user = @user
    if @place.save
      redirect_to place_path(@place)
    else
      render :new
    end
  end

  def destroy
   @place.delete
   rediret_to place_path
  end

  private

  def strong_params
    params.require(:place).permit(:name, :address)
  end

  def set_user
    if user_signed_in?
      @user = current_user
    end
  end

  def set_place
    @place = Place.find(params[:id])
  end
end
