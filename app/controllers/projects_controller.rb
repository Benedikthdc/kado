class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
    @user_id = current_user.id
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
