Sequel.migration do
  change do
    alter_table(:tasks) do
      add_column :parent_task_id, Integer, :null => false
    end
  end
end
