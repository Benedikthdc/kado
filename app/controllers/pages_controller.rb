class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @project = Project.new
    @projects = current_user.owned_projects + current_user.projects
  end
end
