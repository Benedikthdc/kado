class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @project = Project.new
    @projects = current_user.owned_projects + current_user.projects
    @activities = []
    current_user.owned_projects.each do |project|
      @activities += project.ideas + project.messages + project.users
    end

    @activities = @activities.sort_by(&:created_at)
  end
end
