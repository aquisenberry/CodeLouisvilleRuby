class CreateCharacters < ActiveRecord::Migration
	def change
		create_table :characters do |t|
		  t.string :name
		  t.string :gender
		  t.string :species
		  t.integer :age
		  t.string :description
		  t.string :image

		  t.timestamps
		end
		add_index :characters, :name
	end
end
