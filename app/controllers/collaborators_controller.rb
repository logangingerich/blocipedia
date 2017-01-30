class CollaboratorsController < ApplicationController

  def create
    @collaborator = Collaborator.new
    @wiki = Wiki.find_by(id: params[:collaborator][:wiki_id])

    if @collaborator.save
      flash[:notice] = "Your collaborator has been saved."
      redirect_to :index
    else
      flash[:alert] = "There was an error saving your collaborator. Please try again."
      render :show
    end
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])

    if collaborator.destroy
      flash[:notice] = "Collaborator has been deleted"
    else
      flash[:alert] = "There was an error deleting collaborators."
    end

    redirect_to :index
  end

end
