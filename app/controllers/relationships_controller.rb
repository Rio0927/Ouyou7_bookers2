class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    user = User.find(params[:id])
    current_user.follow(user)
    redirect_to request.referer
  end

  def destroy
    user = User.find(params[:id])
    current_user.unfollow(user)
    redirect_to request.referer
  end
  
  def followings
    user = User.find(params[:id])
    @followings = user.followings.all
  end
  
  def followers
    user = User.find(params[:id])
    @followers = user.followers.all
  end
end
