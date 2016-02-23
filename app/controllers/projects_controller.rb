class ProjectsController < ApplicationController
  before_action :set_project, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index]

  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

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
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    # @project = current_user.projects.build(project_params)
    project = Project.create(project_params)
    project.user_id = current_user.id
    project.save
    redirect_to projects_path
  end

  def destroy
    @project.destroy
    if current_user
      @projects = current_user.projects.order(id: :desc)
    else
      @projects = []
    end
    # redirect_to projects_path
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @project.update(project_params)
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end

end
