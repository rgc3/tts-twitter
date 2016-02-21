
class ProfilesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def feed
    @tweet = Tweet.new
    @tweets = Tweet.where("user_id in (?) OR user_id = ?", current_user.friend_ids, current_user).order('created_at DESC')
  end
end
