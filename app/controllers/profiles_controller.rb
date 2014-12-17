class ProfilesController < ApplicationController
  before_action :authenticate_user!



  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
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

  def user_params
    params.require(:user).permit(:first_name, :birth_date, :picture, :address, :city, :country, :zipcode, :mood, medication_ids: [ ])
  end
end
