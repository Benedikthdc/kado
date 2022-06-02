class Users::InvitationsController < Devise::InvitationsController
  def create
    super
    @user
    @project = Project.find(params[:project_id])
    @project.users << @user
  end
end
