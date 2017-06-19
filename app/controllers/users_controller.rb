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
    @user = selected_user

    if @user
      render json: @user
    else
      render json: ["Cannot find user!"], status: 404
    end
  end

  def update
    @user = selected_user

    if @user.update_attributes(user_params)
      render json: @user
    else
      render json: @user.error.full_messages, status: 400
    end
  end

  def destroy
    @user = selected_user

    if @user
      @user.destroy
      render json: @user
    else
      render json: ["Cannot delete user!"], status: 404 
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def selected_user
    User.find_by(id: params[:id])
  end
end
