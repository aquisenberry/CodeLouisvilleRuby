class AddEmail < ActiveRecord::Migration
  def change
  	reversible do |dir|
	  	dir.up{add_column :customers, :email, :string}
	  	dir.down{remove_column :customers, :email}
	end
  end
end
