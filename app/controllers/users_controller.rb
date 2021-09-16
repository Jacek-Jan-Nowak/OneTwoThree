class UsersController < ApplicationController

  def index
    if params[:query].present?
      @users = User.search_by_address(params[:query])
      @users = User.where.not(latitude: nil, longitude: nil)
    else
      @users = User.where.not(latitude: nil, longitude: nil)
      if params[:event].present?
        @event = params[:event]
      end
      if params[:group].present?
        @group = params[:group]
      end
    @events = Event.all
    end
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window: render_to_string(partial: "info_window", locals: { user: user }),
        image_url: helpers.asset_url('noun_Dancing_20415.png')
      }
    end

    @users.each do |user|
      user.level = 0
      user.reviews.each do |review|
        if review.receiver == user
          user.level += review.rating
        end
      end
      user.save
    end

  end

  def show
    @user = User.find(params[:id])
    @reviews = Review.all
    @receiver = @user
    @event = params[:event]
    @group = params[:group]
    # session[:dancer_id] = @user.id

    @marker = [
      {
        lat: @user.latitude,
        lng: @user.longitude,
      }
    ]

  end

  def user_params
    params.require(:query)
  end
end
