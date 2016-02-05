class ProjectsController < ApplicationController
  before_action :set_project, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index]

  def index
    if current_user
      @projects = current_user.projects.order(id: :desc)
    else
      @projects = []
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @project = Project.new
  end

  def create
    # @project = current_user.projects.build(project_params)
    @project = Project.create(project_params)
    @project.user_id = current_user.id
    @project.save
    redirect_to projects_path
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  def edit
  end

  def update
    @project.update(project_params)
    redirect_to projects_path
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end

end
