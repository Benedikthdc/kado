class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  def after_invite_path_for(resource)
    project_path(params[:project_id])
  end
end
