class IdeasController < ApplicationController
  def index
  end

  def new
    @project = Project.find(params[:project_id])
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.user = current_user
    @project = Project.find(params[:project_id])
    @idea.project = @project
    if @idea.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :price, :url)
  end
end
