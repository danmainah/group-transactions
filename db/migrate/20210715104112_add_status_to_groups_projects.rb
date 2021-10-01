class AddStatusToGroupsProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :groups_projects, :status, :string
  end
end
