class PostsController < ApplicationController
  before_filter :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to @post, notice: "Your post was created successfully!"
    else
      render :new
    end
  end

  def show
  end

  def edit
    render :edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post, notice: "Your post has been updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    if @post.delete
      redirect_to posts_path, notice: "Your post has been deleted successfully!"
    else
      redirect_to posts_path, notice: "Ooops, something is wrong :("
    end
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:"date(1i)", :"date(2i)", :"date(3i)", :rationale, :status)
  end
end
