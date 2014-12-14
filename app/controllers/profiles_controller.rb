class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def new
  end

  def create
  end

  def index

  end

  def show
  end

  def edit
  end

  def update
    @user = current_user(user_params)
    @user.update(user_params)
    if @user.save
      redirect_to root_path, notice: 'Merci, votre profil a bien été créé.'
    else
      render :edit, notice: 'Mince, réessayer svp.'
    end
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
