class Task < Sequel::Model
  many_to_one :project
  STATUS_MAP = { "assigned" => "Assigned to ",
                              "planning" => "Creating a plan of action.",
                              "processing" => "In progress.",
                              "completed" => "Completed." }
  
  PRIORITY_MAP = { 0 => "High", 1 => "Normal", 2 => "Low" }

  def self.generate_number_and_create(project, type, parent_part)
    parent_part_id = parent_part.nil? ? 0 : parent_part.id
    parent_part_number = parent_part.nil? ? 0 : parent_part.part_number
    if type == "part"
      part_number = Part.filter(:project_id => project.id, :parent_part_id => parent_part_id, :type => "part")
                        .max(:part_number) || parent_part_number
      part_number += 1
    else
      part_number = Part.filter(:project_id => project.id, :type => "assembly").max(:part_number)  || -100
      part_number += 100
    end
    new(:part_number => part_number, :project_id => project.id, :type => type,
        :parent_part_id => parent_part.nil? ? 0 : parent_part.id)
  end

  def full_part_number
    "#{project.part_number_prefix}-#{type == "assembly" ? "A" : "P"}-%04d" % part_number
  end
end