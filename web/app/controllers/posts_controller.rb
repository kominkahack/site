class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def delete
    Post.find(params[:id]).destroy
    redirect_to root_url
  end

  def create
    @post = Post.new(post_params)
    if @post.save # => Validation
      # Sucess
      @post.send_activation_email
      redirect_to root_url
    else
      # Failure
      render 'new'      
    end
  end

  # private
  #   def post_params
  #     params.require(:post).permit(:title, :content, :thumbnail)
  #   end
  
end
