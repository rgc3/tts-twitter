class ProfilesController < ApplicationController
  def index
	#This sets @users to every User in our database
    @users = User.all
  end

  def show
	#This sets @user to a user based on their id
    @user = User.find(params[:id])
  end

  # Added def create and def user_params for paperclip
  
  def create
  	@user = User.create( user_params )
	end

	private

	# Use strong_parameters for attribute whitelisting
	# Be sure to update your create() and update() controller methods.

	def user_params
	  params.require(:user).permit(:avatar)
	end

end
