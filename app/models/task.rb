class Task < ActiveRecord::Base
  belongs_to :project

  def set_priority(project_id)
    self.priority = Task.where(project_id: project_id).count
    self.save
  end

  def reassing_priority
    project = Project.find(self.project_id)
    incr = 1
    project.tasks.order('priority').each do |task|
      task.update(priority: incr)
      incr += 1
    end
  end

  def up_prior(project)
    prior = self.priority
    if prior != 1
      task = project.tasks.find_by(priority: prior - 1)
      task.update(priority: prior)
      self.update(priority: prior - 1)
    end
  end

  def down_prior(project)
    prior = self.priority
    count = project.tasks.count
    if prior != count
      task = project.tasks.find_by(priority: prior + 1)
      task.update(priority: prior)
      self.update(priority: prior + 1)
    end
  end

end
