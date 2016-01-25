module ApplicationHelper

  def edited_task(id)
    "task_" + id.to_s
  end

  def task_project(id)
    "task_project_" + id.to_s
  end
end
