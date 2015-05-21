require './PhoneNumber'
class Contact
	attr_accessor:firstName,:middleName,:lastName
	attr_reader :phoneNumbers
	def initialize(firstName='John',middleName='',lastName='Smith')
		@firstName = firstName
		@middleName = middleName
		@lastName = lastName
		@phoneNumbers = []
	end
	def addPhoneNumber(kind, number)
		phoneNumber = PhoneNumber.new
		phoneNumber.kind = kind 
		phoneNumber.number = number
		@phoneNumbers.push(phoneNumber)
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