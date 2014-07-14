class Task < Sequel::Model
  many_to_one :project
  STATUS_MAP = { "assigned" => "Assigned to ",
                           "planning" => "Creating a plan.",
                           "processing" => "In progress.",
                           "completed" => "Completed." }
  
  PRIORITY_MAP = { 0 => "High", 1 => "Normal", 2 => "Low" }

  def self.generate_number_and_create(project, type)
    if type == "part"
      task_number = Task.filter(:project_id => project.id, :type => "task")
                        .max(task_number) || parent_part_number
      part_number += 1
    else
      part_number = Task.filter(:project_id => project.id, :type => "assembly").max(:part_number)  || -100
      part_number += 100
    end
    new(:part_number => part_number, :project_id => project.id, :type => type)
  end

  def full_part_number
    "#{project.part_number_prefix}-#{type == "assembly" ? "A" : "P"}-%04d" % part_number
  end
end