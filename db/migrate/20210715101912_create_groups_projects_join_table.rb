class CreateGroupsProjectsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :groups, :projects do |t|
      t.index :group_id
      t.index :project_id
    end
  end
end
