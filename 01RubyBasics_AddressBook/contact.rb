class Contact
	attr_accessor:firstName,:middleName,:lastName
	def initialize(firstName='John',middleName='',lastName='Smith')
		@firstName = firstName
		@middleName = middleName
		@lastName = lastName
	end
	def lastFirst
		lastFirst = @lastName + ','
		lastFirst +=  " " + @firstName
		if !@middleName.nil? && (@middleName.length > 0) then 
			lastFirst += " " + @middleName[0,1] + "."
		end
		lastFirst
	end
	def fullName
		fullName = @firstName
		if !@middleName.nil? && (@middleName.length > 0) then 
			fullName += " " + @middleName
		end
		fullName += " " + @lastName
		fullName
	end
end