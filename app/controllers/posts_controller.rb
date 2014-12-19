class PostsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user, only: [:new, :create, :index]
  before_action :set_post, only: [:show, :reply, :reply_server]

  def new
    @user = current_user
    @post = current_user.posts.build
    #@comment = @post.comments.build(params[:comment])
  end

  def create
    @post= current_user.posts.build(post_params)
     if params[:public] == "true"
       @post.user.build(content: params[:content], privacy: params[:privacy], user: current_user)
     end
     if params[:friends_id].present?
       params[:friends_id].each do |user_id|
         @post.user.build(content: params[:content], privacy: params[:privacy], user_id: user_id.to_i)
       end
     end
    if @post.save
      redirect_to profile_path(current_user), notice: 'Bravo, votre post a bien été publié.'
    else
      render :new, notice: 'Petit problème... réessayer svp.'
    end
    # @comment = Comment.new(comment_params)
    # @comment.user = current_user
    # @comment.post = @post
    # @comment.save
    # if @post.save
    #   redirect_to post_path(@post, anchor: "message_input")
    # else
    #   render :new
    # end
  end

  def index
    @user = User.where(id: params[:profile_id]).first || current_user
    if params[:public] == "true"
      @posts = @user.posts.joins(:post params[:content]: params[:privacy], user: current_user)
    end
    if params[:friends_id].present?
      @posts = @post.user.friends
    end
  end

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

  def set_post
     @post = Post.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def post_params
    params.require(:post).permit(:content, :privacy, :user_id, comments_attributes: [:content])
  end

