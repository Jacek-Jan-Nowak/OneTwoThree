class UsersController < ApplicationController
  
  
  def index
    if params[:query].present?
      @users = User.search_by_address(params[:query])
    else
      @users = User.all
      if params[:event].present?
        @event = params[:event]
      end
    @events = Event.all
    end
  end

  def show
    @user = User.find(params[:id])
    # session[:dancer_id] = @user.id
    
  end

  def user_params
    params.require(:query)
  end
end
