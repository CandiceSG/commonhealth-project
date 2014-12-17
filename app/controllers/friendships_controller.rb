class FriendshipsController < InheritedResources::Base

  def create
    @friendship = current_user.friendship.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to root_url
    else
      flash[:error] = "Unable to add friend."
      redirect_to root_url
    end
  end

    def destroy
      @friendship = Frienship.find(params[:id])
      @friendship.destroy
      flash[:notice] = "Successfully destroyed frienship."
      redirect_to root_url
    end

  private

    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id, :create, :destroy)
    end
end

