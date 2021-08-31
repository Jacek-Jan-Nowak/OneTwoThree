class UsersController < ApplicationController
  def index
    if params[:query].present?
      if params[:options].include?('Events')
        redirect_to events_path(params[:query])
      end
      @users = User.near(params[:query], 10)
    else
      @users = User.all
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
