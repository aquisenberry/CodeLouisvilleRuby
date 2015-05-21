require "./contact"
contacts = []
anthony = {firstName: "Anthony", middleName: "Quinton", lastName: "Quisenberry"}
samantha = {firstName: "Samantha", middleName: "Marie", lastName: "Semones"}
kylah = {firstName: "Kylah", middleName: "Sophia", lastName: "Brown"}
awes = {firstName: "Awes", middleName: "", lastName: "Saidi"}

contacts.push(anthony,samantha,kylah,awes)

contact = Contact.new 
puts contact.fullName
puts contact.lastFirst

contacts.each do |con|
	contact1 = Contact.new(con[:firstName],con[:middleName],con[:lastName])
	puts "----------"
	puts "First name: " + contact1.firstName
	puts "Middle name: " + contact1.middleName
	puts "Last name: " + contact1.lastName
	puts "Last name first: " + contact1.lastFirst
	puts "Full name: " + contact1.fullName
	puts "----------\n\n\n"
end