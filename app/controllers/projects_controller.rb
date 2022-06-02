class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @message = Message.new
    @user_id = current_user.id
    @ideas = @project.ideas.sort_by(&:total_votes).reverse.first(3)
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    @project.save
  end

  private

  def project_params
    params.require(:project).permit(:name, :date)
  end
end
