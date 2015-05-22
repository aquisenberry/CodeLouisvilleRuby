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
end