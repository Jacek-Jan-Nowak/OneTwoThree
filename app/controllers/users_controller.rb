class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    # session[:dancer_id] = @user.id
    
  end
end
