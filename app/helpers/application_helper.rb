module ApplicationHelper

  def edited_task(id)
    "task_#{id}"
  end

  def task_project(id)
    "task_project_#{id}"
  end

  def active_project(id)
    "project_#{id}"
  end

end
