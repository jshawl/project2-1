class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @manager = Manager.find(session[:manager]['id'])
    @post = @manager.posts.new(post_params)
    if @post.save
      redirect_to @manager
    else
      render @manager
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
    @manager = Manager.find(session[:manager]["id"]) #I really don't like this. Is there something better?
    @post = Post.find(params[:id])
    @post.destroy #should add some warning
    redirect_to @manager
  end

  private
  def post_params
    params.require(:post).permit(:title, :description)
  end
end
