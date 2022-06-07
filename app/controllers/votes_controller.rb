class VotesController < ApplicationController
  def create
    @idea = Idea.find(params[:idea_id])
    @value = params[:value] == "positive" ? 1 : -1
    @vote = Vote.create(idea: @idea, user: current_user, value: @value)
    flash[:alert] = "Voted succesfully"
    redirect_to project_ideas_path(@idea.project)
  end
end
