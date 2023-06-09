class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: :create
  before_action :find_user, only: [:show, :update, :destroy]

  def index
    Rails.cache.fetch("all_users", expires_in: 2.hours) do
      @users = User.all
    end

    render json: @users, status: 200 
  end

  def show
    render json: @user, status: 200
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: 201
    else
      render json: {errors: @user.erros.full_messages}, status: 503
    end
  end

  def update
    unless @user.update(user_params)
      render json: {errors: @user.erros.full_messages}, status: 503
    end
  end

  def destroy
    @user.destroy
  end

  private

  def user_params
    params.permit(:first_name, :middle_name, :last_name, :password, :password_confirmation, :email, :access_level)
  end

  def find_user
    @user = User.find(params[:id])
  end
end