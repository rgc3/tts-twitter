class RelationshipsController < ApplicationController
  def index
    @relationships = Relationship.all
  end
  def show
    @relationship = Relationship.find(params[:id])
    end

  # POST /relationships
  # POST /relationships.json
  def create
    @relationship = current_user.relationships.build(:friend_id => params[:friend_id])
  if @relationship.save
    flash[:notice] = "Followed successfully."
    redirect_to :back
  else
    flash[:notice] = "Unable to follow."
    redirect_to root_path
  end
  end

  # DELETE /relationships/1
  # DELETE /relationships/1.json
def destroy
  @relationship = current_user.relationships.find(params[:id])
  @relationship.destroy
  flash[:notice] = "No longer following."
  redirect_to profile_path(current_user.id)
end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def relationship_params
      params.require(:relationship).permit(:user_id, :friend_id)
    end
end
