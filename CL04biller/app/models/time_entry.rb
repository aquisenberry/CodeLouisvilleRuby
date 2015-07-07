class TimeEntry < AccountEntry
	belongs_to :customer
	belongs_to :employee
end
