class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :set_user, only: [:new, :create]
  before_action :set_post, only: [:show]

  def new
    @post = current_user.posts.new
  end

  def create
    @post= current_user.posts.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to profile_path(current_user), notice: 'Bravo, votre post a bien été publié.'
    else
      render :new, notice: 'Petit problème... réessayer svp.'
    end
  end

  def index
    @user = User.where(id: params[:user_id]).first || current_user
    @posts = Post.all
  end

  end

  def show
  end

  def edit
    redirect_to posts_path unless @post.user = current_user
  end

  def update
    if @post.user == current_user
        if @post.update(post_params)
          redirect_to profile_path(current_user), notice: 'Bravo, votre post a bien été modifié.'
        else
          render 'edit'
        end
    else
        redirect_to posts_path
        flash[:notice] = "Vous ne pouvez pas modifié ce message"
    end
  end


  def destroy
   if @post.destroy
      redirect_to profile_path(current_user), notice: "Votre status a bien été supprimé."
   else
     redirect_to posts_path
     flash[:notice] = "Vous ne pouvez pas modifier ce message"
   end
  end

  private

  def set_user
    @user = current_user
  end

  def set_post
     @post = current_user.posts.find(params[:post_id])
  end

  # def comment_params
  #   params.require(:comment).permit(:content)
  # end

  def post_params
    params.require(:post).permit(:content, :privacy, :user_id, comments_attributes: [:content])
  end

