class ProjectsController < ApplicationController
  def index
    @portfolio_projects = Project.all
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
    @portfolio_project = Project.find(params[:id])
  end

  def update
    @portfolio_project = Project.find(params[:id])
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
    @portfolio_project = Project.find(params[:id])
  end

  def destroy
    @portfolio_project = Project.find(params[:id])

    @portfolio_project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    def project_params
      params.require(:project).permit(:title, :subtitle, :body)
    end
end
