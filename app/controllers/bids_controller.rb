class BidsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = User.find(session[:user]['id'])
    @bid = params.require(:bid).permit(:info)
    if @post.bids.find_by(user:@user)
      flash[:notice] = "Already submitted bid for this post"
      redirect_to @post
    else
      @post.bids.create(info: @bid[:info], user: @user)
      redirect_to user_path(@user)
    end
  end
end
