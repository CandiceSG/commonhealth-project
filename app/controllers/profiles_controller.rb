class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
    @user = User.where(id: params[:user_id]).first || current_user
    @posts = Post.all
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
    current_user.destroy
    redirect_to root_path,  notice: 'Votre profil a bien été supprimé'
  end

private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :birth_date, :picture, :address, :city, :country, :zipcode, :mood, medication_ids: [ ])
  end
end
