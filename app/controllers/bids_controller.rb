class BidsController < ApplicationController
  def edit
    @bid = Bid.find(params[:id])
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @user = User.find(session[:user]['id'])
    @bid = bid_params
    if @post.bids.find_by(user:@user)
      flash[:notice] = "Already submitted bid for this post"
      redirect_to @post
    else
      @post.bids.create(info: @bid[:info], user: @user)
      redirect_to user_path(@user)
    end
  end

  def update
    @bid = Bid.find(params[:id])
    if @bid.update(bid_params)
      redirect_to @bid.user
    else
      flash[:notice] = "Could not update"
      render "edit"
    end
  end
  def destroy
    @bid = Bid.find(params[:id])
    @user = @bid.user
    @bid.destroy
    redirect_to @user

  end
  private
  def bid_params
    params.require(:bid).permit(:info)
  end

end
