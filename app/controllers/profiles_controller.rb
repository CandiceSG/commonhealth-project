class ProfilesController < ApplicationController
  before_action :set_user
  before_action :authenticate_user

  def new
    @user = current_user
  end

  def create
    @user = current_user(user_params)
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :birth_date, :picture, :address, :city, :country, :zipcode, :mood)
  end
end
