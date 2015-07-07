class Customer < Account
	has_many :time_entries
	def total_hours
		time_entries.sum(:time)
	end
end
