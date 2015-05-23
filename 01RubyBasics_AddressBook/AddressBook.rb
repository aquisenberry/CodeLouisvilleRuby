require "./Contact"
class AddressBook
	attr_reader :contacts
	def initialize
		@contacts = []
	end
	def printContactList
		puts "Contact List"
		contacts.each{|contact| puts contact.to_s('lastFirst')}
	end

	def findByName(name)
		cons = []
		search= name.downcase
		contacts.each{|contact|
			if contact.fullName.downcase.include?(search) then
				cons.push(contact)
			end
		}
		printContacts(cons,"Name")
	end
	def findByPhoneNumber(number)
		results = []
		search = number.gsub("-","")
		contacts.each{|contact|
			contact.phoneNumbers.each{|number|
				if number.number.gsub("-","").include?(search) then
					results.push(contact)
					break
				end
			}
		}
		printContacts(results,"Phone Number")
	end
	def findByAddress(address)
		results = []
		search = address.downcase
		contacts.each{|contact|
			contact.addresses.each{|addy|
				if addy.to_s("long").downcase.include?(search) then
					results.push(contact)
					break
				end
			}
		}
		printContacts(results, "Address")
	end
	def printContacts(result, string)
		puts "Results by #{string}"
		result.each{|item|
			puts item.to_s("fullName")
		}
	end
	def addAddress(contact)
		print "Type: "
		kind = gets.chomp
		print "Street 1: "
		street1 = gets.chomp
		print "Street 2: "
		street2 = gets.chomp
		print "City: "
		city = gets.chomp
		print "State: "
		state = gets.chomp
		print "Zipcode: "
		zip = gets.chomp
		contact.addAddress(kind,street1,street2,city,state,zip)
	end
	def addPhone(contact)
		print "Type: "
		kind = gets.chomp
		print "Phone Number: "
		number = gets.chomp
		contact.addPhoneNumber(kind,number)
	end
	def addContact
		contact = Contact.new
		print "First Name: "
		contact.firstName = gets.chomp
		print "Middle Name: "
		contact.middleName = gets.chomp
		print "Last Name: "
		contact.lastName = gets.chomp
		additionalDetails(contact,"address")
		additionalDetails(contact, "phone number")
		contacts.push(contact)
	end
	def aOrAn(str)
		if str[0,1] == "a" || str[0,1] == "e" || str[0,1] == "i" || str[0,1] == "o" || str[0,1] == "u"
			return "an"
		end
		return "a"
	end
	def additionalDetails(contact,str)
		print "Would You like to add #{aOrAn(str)} #{str}? [Y/n]: "
		response = gets.chomp
		while response.downcase == "y" || response == ""
			case str
			when "address"
				addAddress(contact)
			when "phone number"
				addPhone(contact)
			end
			print "Would you like to add another #{str}? [Y/n]: "
			response = ""
			response = gets.chomp
		end

	end
	def run
		loop do
			puts "Address Book"
			puts "e: Exit"
			puts "c: Add Contact"
			puts "p: Print Address Book"
			print "Enter Your Choice: "
			input = gets.chomp.downcase

			case input
			when "e"
				break
			when "p"
				printContactList
			when "c"
				addContact
			end
		end
	end
end