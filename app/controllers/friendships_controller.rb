class FriendshipsController < InheritedResources::Base
  before_action :set_friend, only: [:index, :destroy]

  def index
    @user = User.where(id: params[:profile_id]).first || current_user
    @friends = @user.friendships
  end

  def new
  end

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
      @friendship = current_user.frienships.find(params[:id])
      @friendship.destroy
      flash[:notice] = "Removed frienship."
      redirect_to profile_path
    end

  private

    def set_friend
    @friend = Friend.find(params[:friend_id])
    end

    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id, :create, :destroy)
    end
end

