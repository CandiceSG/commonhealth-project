class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_medication

  def new
    @medication = Medication.new
  end

  def create
    @medication = Medication.new(medication_params)
  end

  def index
    @medications = Medication.all
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


  def user_params
    params.require(:user).permit(:first_name, :birth_date, :picture, :address, :city, :country, :zipcode, :mood)
  end

  def set_medication
    @medication = Medication.find(params[:medication_id])
  end
end
