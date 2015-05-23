require './PhoneNumber'
require './Address'
class Contact
	attr_accessor:firstName,:middleName,:lastName, :addresses
	attr_reader :phoneNumbers
	def initialize(firstName='John',middleName='',lastName='Smith')
		@firstName = firstName
		@middleName = middleName
		@lastName = lastName
		@phoneNumbers = []
		@addresses= []
	end
	def addAddress(kind,street1,street2,city,state,zip)
		address = Address.new
		address.kind = kind
		address.street1 = street1
		address.street2 = street2
		address.city = city
		address.state = state 
		address.zip = zip
		addresses.push(address)
	end
	def addPhoneNumber(kind, number)
		phoneNumber = PhoneNumber.new
		phoneNumber.kind = kind 
		phoneNumber.number = number
		phoneNumbers.push(phoneNumber)
	end
	def printPhoneNumbers
		puts "Phone Numbers"
		phoneNumbers.each{|number| puts number}
	end
	def printAddresses
		puts "Addresses"
		addresses.each{|address| puts address.to_s}
	end
	def lastFirst
		lastFirst = lastName + ','
		lastFirst +=  " " + firstName
		if !middleName.nil? && (middleName.length > 0) then 
			lastFirst += " " + middleName[0,1] + "."
		end
		lastFirst
	end
	def fullName
		fullName = firstName
		if !middleName.nil? && (middleName.length > 0) then 
			fullName += " " + middleName
		end
		fullName += " " + lastName
		fullName
	end
	def to_s(format='full_name')
		result = "\n----------\nContact:\n\t"
		case format
		when "full_name"
			result += fullName + "\n"
		when "last_first"
			result += lastFirst+ "\n"
		when "first"
			result += firstName+ "\n"
		when "last"
			result += lastNam + "\n"
		else
			result += fullName + "\n"
		end
			result += "Phone:\n"
			phoneNumbers.each{|number| result +="\t"+number.to_s+"\n"}
			result += "Address:\n"
			addresses.each{|address| result+="\t"+address.to_s+"\n"}
			result += "----------\n"
			result
	end
end