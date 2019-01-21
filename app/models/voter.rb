class Voter < ApplicationRecord
 
	scope :support, -> { where(vote_preference: 'support') }
	scope :oppose, -> { where(vote_preference: 'oppose') }
	scope :undecided, -> { where(vote_preference: 'undecided') }
 
	def self.stats
		@voters = {
			support: self.support, 
			oppose: self.oppose, 
			undecided: self.undecided 
		}
	end

	def address_string
		if self
			self.street_number + ' ' +  self.street_name + ', ' + self.city + ', ' + self.state + ' ' + self.postal_code  
 		end
 	end
end
