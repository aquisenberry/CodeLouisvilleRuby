class AddUserToResourceType < ActiveRecord::Migration
  def change
  	add_column :resource_types, :user_id, :integer
  end
end
