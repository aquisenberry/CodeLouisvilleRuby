require "./Contact"
contacts = []
anthony = {firstName: "Anthony", middleName: "Quinton", lastName: "Quisenberry", home: "(111)111-1111", work: "(222)222-2222", cell: "(333)333-3333"}
samantha = {firstName: "Samantha", middleName: "Marie", lastName: "Semones", home: "", work: "(222)222-2222", cell: "(333)333-3333"}
kylah = {firstName: "Kylah", middleName: "Sophia", lastName: "Brown", home: "(111)111-1111", work: "", cell: ""}
awes = {firstName: "Awes", middleName: "", lastName: "Saidi", home: "(111)111-1111", work: "", cell: "(333)333-3333"}

contacts.push(anthony,samantha,kylah,awes)

contact = Contact.new 

puts contact.fullName
puts contact.lastFirst

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
	puts "----------"
	puts "First name: " + contact1.firstName
	puts "Middle name: " + contact1.middleName
	puts "Last name: " + contact1.lastName
	puts "Last name first: " + contact1.lastFirst
	puts "Full name: " + contact1.fullName
	puts "Numbers: "
	contact1.phoneNumbers.each do |number|
		puts "\t" + number.to_s
	end
	puts "----------\n\n\n"
end