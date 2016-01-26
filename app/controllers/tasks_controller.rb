class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, except: [:create]

   def create
    @task = @project.tasks.create(task_params)
    @task.set_priority(@project.id)
    respond_to do |format|
      format.html { redirect_to projects_path }
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.html { redirect_to project_task_path }
      format.js
    end
  end

  def update
    @task.update(task_params)
    respond_to do |format|
      format.html { redirect_to projects_path }
      format.js
    end
  end

  def destroy
    @task.reassing_priority
    respond_to do |format|
      format.html { redirect_to projects_path }
      format.js
    end
  end

  def up_priority
    @task.up_prior(@project)
    respond_to do |format|
      format.html { redirect_to projects_path }
      format.js
    end
  end

  def down_priority
    @task.down_prior(@project)
    respond_to do |format|
      format.html { redirect_to projects_path }
      format.js
    end
  end

  private

    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_task
      @task = @project.tasks.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :status)
    end

end
