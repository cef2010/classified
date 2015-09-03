class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.save
    if @post && @post.save
      flash[:success] = "Post was successfully saved."
      redirect_to posts_path
    else
      flash[:error] = "Post was not succesfully saved."
      render new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Post with id: #{params[:id]} updated"
      redirect_to posts_path
    else
      flash[:error] = "Post with id: #{params[:id]} not updated"
      redirect_to posts_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post
      if @post.destroy
        flash[:success] = "Post deleted"
        redirect_to posts_path
      end
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :author, :body, :category)
    end

end
