class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, except: [:create]

   def create
    @task = @project.tasks.create(task_params)
    redirect_to projects_path
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to projects_path
  end

  def destroy
    @task.destroy
    redirect_to projects_path
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
