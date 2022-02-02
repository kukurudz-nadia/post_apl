class PostsController < ApplicationController
  #before_action :set_post, only: %i[ show update destroy ]
  before_action :authenticate_user!
  before_action only: [:update, :destroy] do
    is_admin_or_user
  end

  # GET /posts
  def index
    @posts = Post.all
    render json: @posts,status: 200, each_serializer:  PostsSerializer
  end

  # GET /posts/1
  def show
    @post = Post.find(params[:id])
    render json: @post, status: 200#, serializer: PostSerializer
  end

  # POST /posts
  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    render json: @post, status:200#, serializer: PostSerializer
  end

  # DELETE /posts/1
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    render json: {message: 'User was deleted successfully'}, status:200
  end

  private

  def authorized
    # code here
  end

  private
  def is_admin_or_user
    @post = Post.find(params[:id])

    if  @post.nil? or @post.user_id.nil?
      render status: :not_found
    elsif current_user.role_id == 2 || @post.user_id == current_user.id
      return
    else
      render json: { message: "Access forbidden" }, status: :forbidden
    end
  end
    # Use callbacks to share common setup or constraints between actions.
    # def set_post
    #   @post = Post.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:user_id, :title, :message, :status,)
    end
end
