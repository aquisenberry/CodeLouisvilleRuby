class ReformatResources < ActiveRecord::Migration
  def change
  	remove_column :writer_resources, :resource_type_id
  	remove_column :writer_resources, :resource_value_1_i
  	remove_column :writer_resources, :resource_value_2
  	remove_column :writer_resources, :resource_value_3
  	remove_column :writer_resources, :resource_value_4
  	remove_column :writer_resources, :resource_value_5
  	remove_column :writer_resources, :resource_value_6

  	add_column :writer_resources, :details, :text

  	drop_table :resource_types
  end
end
