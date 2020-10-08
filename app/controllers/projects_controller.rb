class ProjectsController < ApplicationController
  def index
    @portfolio_projects = Project.all
  end
end
