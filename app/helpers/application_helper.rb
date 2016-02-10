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

  def date_time(datetime)
  	datetime.blank? ? nil :	datetime.strftime("%d/%b")
  end

  def dead_line(id)
    if Task.find_by(id: id).dead_line.blank?
      ""
    else
      Task.find_by(id: id).overdue? ? "dead_line_red" : "dead_line"
    end
  end

  def new_or_extst_project(project)
    project.name.blank? ? projects_path : project_path
  end

end
