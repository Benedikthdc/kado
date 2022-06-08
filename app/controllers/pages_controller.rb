class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @project = Project.new
    @projects = current_user.owned_projects + current_user.projects
    @activities = []
    @projects.each do |project|
      @activities += project.ideas + project.messages + project.users
    end

    @activities = @activities.sort_by(&:created_at)
  end

  def profile
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to profile_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :iban, :paypal, :photo)
  end
end
