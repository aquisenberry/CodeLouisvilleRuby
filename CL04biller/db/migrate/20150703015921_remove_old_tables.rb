class RemoveOldTables < ActiveRecord::Migration
  def change
  	reversible do |dir|
  		dir.up 		{
  			Customer.all.each do |c|
  				Account.create(name: c.name, about: c.about)
  			end
  			Employee.all.each do |e|
  				Account.create(name: e.name, email: e.email)
  			end
  			drop_table :customers
  			drop_table :employees
  		}
  		dir.down 	{}
  	end
  end
end
