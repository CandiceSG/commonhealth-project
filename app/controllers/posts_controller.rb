class PostsController < ApplicationController
  before_action :set_post, only: [:show, :reply, :reply_server]
  before_action :set_user, only: [:new, :create]

  def new
    @post = @user.posts.new
    @post.user = current_user
    @comment = Comment.new
  end

  def create
    @post =  @user.posts.new(post_params)
    @post.user_id = current_user.id
    if params[:public] == "true"
      @post.user.build(content: params[:content], privacy: params[:privacy], user: current_user)
    end
    if params[:friends_id].present?
      params[:friends_id].each do |user_id|
        @post.user.build(content: params[:content], privacy: params[:privacy], user_id: user_id.to_i)
      end
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
     @post = @user.posts.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def post_params
    params.require(:post).permit(:content, :privacy, comments_attributes: [:content])
  end
end
