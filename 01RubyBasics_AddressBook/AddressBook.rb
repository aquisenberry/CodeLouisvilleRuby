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
end