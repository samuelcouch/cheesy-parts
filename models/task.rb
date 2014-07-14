class Part < Sequel::Model
  many_to_one :project
  many_to_one :parent_task, :class => self
  one_to_many :child_tasks, :key => :parent_task_id, :class => self

  TASK_TYPES = ["task", "group"]

  # The list of possible part statuses. Key: string stored in database, value: what is displayed to the user.
  STATUS_MAP = { "assigned" => "Assigned to ",
                           "planning" => "Creating a plan.",
                           "processing" => "In progress.",
                           "completed" => "Completed." }

  # Mapping of priority integer stored in database to what is displayed to the user.
  PRIORITY_MAP = { 0 => "High", 1 => "Normal", 2 => "Low" }

  # Assigns a part number based on the parent and type and returns a new Part object.
  def self.generate_number_and_create(project, type, parent_task)
    parent_task_id = parent_task.nil? ? 0 : parent_task.id
    parent_task_number = parent_task.nil? ? 0 : parent_task.task_number
    if type == "task"
      task_number = Task.filter(:project_id => project.id, :parent_task_id => parent_task_id, :type => "task")
                        .max(:task_number) || parent_task_number
      task_number += 1
    else
      task_number = Task.filter(:project_id => project.id, :type => "group").max(:task_number)  || -100
      task_number += 100
    end
    new(:task_number => task_number, :project_id => project.id, :type => type,
        :parent_task_id => parent_task.nil? ? 0 : parent_task.id)
  end

  def full_part_number
    "#{project.task_number_prefix}-#{type == "group" ? "A" : "P"}-%04d" % task_number
  end
end