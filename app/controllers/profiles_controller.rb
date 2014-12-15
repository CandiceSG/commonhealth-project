class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_medication

  def new
  end

  def create
  end

  def index
  end

  def show
  end

  def edit
    @medications = Medication.all
  end

  def update
    #if @medication.update_attributes(params[:medication_id])
    if current_user.update(user_params)
      redirect_to profile_path(current_user), notice: 'Merci, votre profil a bien été créé.'
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

  def set_medication
    #@medication = Medication.find(params[:medication_id])
  end

  def user_medication_params
    params.require(:user_medication).permit(:medication_id)
  end

  def user_params
    params.require(:user).permit(:first_name, :birth_date, :picture, :address, :city, :country, :zipcode, :mood, user_medications_attributes: [ :medication_id ])
  end
end
