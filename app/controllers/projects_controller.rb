class ProjectsController < ApplicationController
  def show
    @idea = Idea.new
    @maxvote = Vote.maximum('value')
    @vote = Vote.find_by(value: @maxvote)
    @finalidea = @vote&.idea
    @project = Project.find(params[:id])
    @time_until_date = (Date.today - @project.date).to_i * (-1)
    @user_projects = UserProject.where(project: @project)
    @user_project = UserProject.where(project: @project, user: current_user).first
    @payment_calc = (UserProject.where(project: @project, paid: true).count * @payment).round(2)
    @payment = @project.users.empty? ? 0 : @finalidea&.price || 0 / @project&.users&.count
    @message = Message.new
    @user_id = current_user.id
    @ideas = @project.ideas.sort_by(&:total_votes).reverse.first(3)
    @countdown = ((Date.today - @project.date).to_i * (-1)) - 5
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    @project.save
    redirect_to project_path(@project)
  end

  def pay
    @project = Project.find(params[:id])
    @user_project = UserProject.where(project: @project, user: current_user).first
    @user_project.paid = true
    @user_project.save
    redirect_to project_path(@project)
  end

  private

  def project_params
    params.require(:project).permit(:name, :date)
  end
end
