class AddTypeFieldToAccountEntry < ActiveRecord::Migration
  def change
  	add_column :account_entries, :type, :string
  end
end
