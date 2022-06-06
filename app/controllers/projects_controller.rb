class ProjectsController < ApplicationController
  def show
    @idea = Idea.new
    @project = Project.find(params[:id])
    @message = Message.new
    @user_id = current_user.id
    @ideas = @project.ideas.sort_by(&:total_votes).reverse.first(3)
    @countdown = (Date.today - @project.date).to_i * (-0.9)
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    @project.save

    redirect_to project_path(@project)
  end

  private

  def project_params
    params.require(:project).permit(:name, :date)
  end
end
