class UsersController < ApplicationController

  def index
    @users = User.all   
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      redirect_to '/login'
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :image_url, :bio)
    end
end







