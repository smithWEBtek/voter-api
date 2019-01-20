class Voter < ApplicationRecord

	def address_string
		self.street_number + ' ' +  self.street_name + ', ' + self.city + ', ' + self.state + ' ' + self.postal_code  
 	end
end
