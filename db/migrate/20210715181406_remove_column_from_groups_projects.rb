class RemoveColumnFromGroupsProjects < ActiveRecord::Migration[6.1]
  def change
    remove_column :groups_projects, :status, :string
  end
end
