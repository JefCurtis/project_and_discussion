class AddProjectIdToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :project, :references
  end
end
