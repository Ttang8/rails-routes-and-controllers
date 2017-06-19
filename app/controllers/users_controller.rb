class UsersController < ApplicationController
  def index
    @users = User.all

    render json: @users
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user
    else
      render json: @post.errors.full_messages, status: 400
    end
  end

  def show
    render json: params
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
