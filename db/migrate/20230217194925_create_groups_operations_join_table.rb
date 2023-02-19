class CreateGroupsOperationsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :operations, :groups
  end
end
