class PostsController < ApplicationController
  before_filter :find_post, only: [:show]

  def index

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:date, :rationale))

    if @post.save
      redirect_to @post, notice: "Your post was created successfully!"
    else
      render :new
    end
  end

  def show
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:date, :rationale)
  end
end
