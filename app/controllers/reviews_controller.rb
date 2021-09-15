class ReviewsController < ApplicationController
  before_action :find_review, only: [:edit, :update, :destroy]
  before_action :set_user, except: [:destroy]

  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    @review.receiver = @user
    
    @user.level += @review.rating

    @review.user = current_user
    if @review.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @review.update(review_params)
    @user.level += @review.rating
    if @review.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @review.delete
    @user = @review.receiver
    redirect_to user_path(@user)
  end

  private

  def find_review
    @review = Review.find(params[:id])
  end

  def set_user
    @user = user.find(params[:user_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating, :receiver, :user_id)
  end
end
