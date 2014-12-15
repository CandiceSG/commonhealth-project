class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  #before_action :set_user_medication

  def new
    #@user_medication = current_user.user_medications.new
  end

  def create
    #@user_medication = current_user.user_medication.new(medication_params)
    #if @user_medication.save
      #redirect_to to @user
    #else
      #render 'new'
    #end
  end

  def index
    #@medications = @user.medications.all
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to profile_path, notice: 'Merci, votre profil a bien été créé.'
    else
      render :edit, notice: 'Mince, réessayer svp.'
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path,  notice: 'Votre profil a bien été supprimé'
  end

private
  def set_user
    @user = current_user
  end

  def set_user_medication
    #@user_medication = User_medication.find(params[:user_medication_id])
  end

  def user_params
    params.require(:user).permit(:first_name, :birth_date, :picture, :address, :city, :country, :zipcode, :mood)
  end
end
