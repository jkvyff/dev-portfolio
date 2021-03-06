class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :show, :destroy]
  layout "projects"

  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, site_admin: :all

  
  def index
    @portfolio_projects = Project.by_position
  end

  def new
    @portfolio_project = Project.new
  end

  def create
    @portfolio_project = Project.new(project_params)

    respond_to do |format|
      if @portfolio_project.save
        format.html { redirect_to projects_path, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio_project }
      else
        format.html { render :new }
        format.json { render json: @portfolio_project.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @portfolio_project.update(project_params)
        format.html { redirect_to projects_path, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio_project }
      else
        format.html { render :edit}
        format.json { render json: @portfolio_project.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def destroy
    @portfolio_project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def sort
    params[:project].each_with_index do |id, index|
      Project.where(id: id).update_all(position: index + 1)
    end
    head :ok
  end


  private
  def set_project
    @portfolio_project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, 
                                    :subtitle, 
                                    :body,
                                    :main_image,
                                    :thumb_image,
                                    technologies_attributes: [:id, :name, :_destroy]
                                    )
  end
end
