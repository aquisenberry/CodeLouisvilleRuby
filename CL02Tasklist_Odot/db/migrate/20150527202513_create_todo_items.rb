class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.references :todoList, index: true
      t.string :content

      t.timestamps
    end
  end
end
