class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def new
    @user = current_user
  end

  def create
    @user = current_user(user_params)
    if @user.save
      redirect_to root_path, notice: 'Merci, votre message a été correctement créé.'
    else
      render :new, notice: 'Mince, réessayer svp.'
    end
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
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :birth_date, :picture, :address, :city, :country, :zipcode, :mood)
  end
end
