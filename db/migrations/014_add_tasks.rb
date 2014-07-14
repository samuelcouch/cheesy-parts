Sequel.migration do
  change do
    create_table(:tasks) do
      primary_key :id
      Integer :task_number, :null => false, :unique => true
      Integer :project_id, :null => false
      Integer :priority, :null => false
      String :type, :null => false
      String :name, :null => false
      String :status
      Text :notes
    end
  end
end
