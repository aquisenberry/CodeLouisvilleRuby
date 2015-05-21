class Address
	attr_accessor :kind, :street1, :street2, :city, :state, :zip
	def initialize
	end
	def to_s(format='short')
		address = ''
		case format
		when 'long'
			address += street1 + "\n"
			address += street2 + "\n" if !street2.nil?
			address += "#{city}, #{state} #{zip}"
		when 'short'
			address += "#{kind}: "
			address += street1
			if street2
			address += " " + street2
			end
			address += ", #{city}, #{state}, #{zip}"
		end
	end
end
