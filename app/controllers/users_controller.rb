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
      }
    end
    users_level(@users)
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
    user_level(@user)
  end
  
  private
  
  def users_level(users)
    users.each do |user|
      user_reviews = Review.where(receiver: user)
      user.level = 0
      user_reviews.each do |user_review|
        user.level += user_review.rating
      end
    end
  end

  def user_level(user)
    user_reviews = Review.where(receiver: user)
    user.level = 0
    user_reviews.each do |user_review|
      user.level += user_review.rating
    end
  end

  def user_params
    params.require(:query)
  end
end
