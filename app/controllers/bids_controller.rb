class BidsController < ApplicationController
  def edit
    @bid = Bid.find(params[:id])
    @post = Post.find(params[:post_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @bid = bid_params
    if @post.bids.find_by(user: current_user)
      flash[:notice] = "#{current_user.username} has already submitted a bid for this post"
      redirect_to @post
    else
      @post.bids.create(info: @bid[:info], user: current_user)
      redirect_to current_user
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
