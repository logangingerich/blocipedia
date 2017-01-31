class CollaboratorsController < ApplicationController

  def create
    @wiki = Wiki.find(params[:collaborator][:wiki_id])
    @users = User.find(params[:collaborator][:user_id])
    @collaborator = @wiki.collaborators.new(user_id: params[:collaborator][:user_id])

    if @collaborator.save
      flash[:notice] = "Your collaborator has been saved."
      redirect_to wikis_path
    else
      flash[:alert] = "There was an error saving your collaborator. Please try again."
      render :show
    end
  end

  def destroy

    @collaborator = Collaborator.find(params[:id])

    if @collaborator.destroy
      flash[:notice] = "Collaborator has been deleted"
    else
      flash[:alert] = "There was an error deleting collaborators."
    end

    redirect_to wikis_path
  end

end
