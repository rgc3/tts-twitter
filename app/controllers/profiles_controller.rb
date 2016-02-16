class ProfilesController < ApplicationController
  def index
	#This sets @users to every User in our database
    @users = User.all
  end

  def show
	#This sets @user to a user based on their id
    @user = User.find(params[:id])
  end
end
