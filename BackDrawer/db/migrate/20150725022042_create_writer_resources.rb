class CreateWriterResources < ActiveRecord::Migration
  def change
    create_table :writer_resources do |t|
      t.integer :user_id
      t.integer :resource_type_id
      t.string :resource_name
      t.string :resource_value_1_i
      t.string :resource_value_2
      t.string :resource_value_3
      t.string :resource_value_4
      t.text :resource_value_5
      t.text :resource_value_6

      t.timestamps
    end
    add_index :writer_resources, :resource_value_1_i
    create_table :resource_types do |t|
   	  t.string :type_name
   	  t.string :value_1_header_i
   	  t.string :value_2_header
   	  t.string :value_3_header
   	  t.string :value_4_header
   	  t.string :value_5_header
   	  t.string :value_6_header
   	  t.timestamps
    end
  end
end
