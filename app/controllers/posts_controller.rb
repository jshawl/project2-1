class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = current_manager.posts.new(post_params)
    if @post.save
      redirect_to current_manager
    else
      flash[:notice] = "Could not create post"
      render current_manager
    end
   end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy #should add some warning
    redirect_to current_manager
  end

  private
  def post_params
    params.require(:post).permit(:title, :description)
  end
end
