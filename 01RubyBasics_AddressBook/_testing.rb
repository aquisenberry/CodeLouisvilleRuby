require "./Contact"
require "./AddressBook"
contacts = []
anthony = {firstName: "Anthony", middleName: "Quinton", lastName: "Quisenberry", home: "(111)111-1111", work: "(222)222-2222", cell: "(333)333-3333"}
samantha = {firstName: "Samantha", middleName: "Marie", lastName: "Semones", home: "", work: "(222)222-2222", cell: "(333)333-3333"}
kylah = {firstName: "Kylah", middleName: "Sophia", lastName: "Brown", home: "(111)111-1111", work: "", cell: ""}
awes = {firstName: "Awes", middleName: "", lastName: "Saidi", home: "(111)111-1111", work: "", cell: "(333)333-3333"}

contacts.push(anthony,samantha,kylah,awes)

addressBook = AddressBook.new
contact = Contact.new 

# puts contact.fullName
# puts contact.lastFirst

contacts.each do |con|
	contact1 = Contact.new(con[:firstName],con[:middleName],con[:lastName])
	if con[:home].length > 0 then
		contact1.addPhoneNumber("home",con[:home])
	end
	if con[:work].length > 0 then 
		contact1.addPhoneNumber("work",con[:work])
	end
	if con[:cell].length > 0 then 
		contact1.addPhoneNumber("cell",con[:cell])
	end
	contact1.addAddress("Home", "123 Main St.", "", "Portland", "OR", "12345")
	addressBook.contacts.push(contact1)
end

jason = Contact.new
jason.firstName = "Jason"
jason.lastName = "Seifer"
jason.addPhoneNumber("Home", "123-456-7890")
jason.addPhoneNumber("Work", "456-789-0123")
jason.addAddress("Home", "123 Main St.", "", "Portland", "OR", "12345")

# puts jason.to_s('full_name')
# jason.printPhoneNumbers
# jason.printAddresses

addressBook.contacts.push(jason)
#test printContactList
#addressBook.printContactList

#test findByName
# addressBook.findByName("e")

#test findByPhoneNumber
# addressBook.findByPhoneNumber("2")

#test findByAddress
# addressBook.findByAddress("1")

addressBook.run