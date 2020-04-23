class HotSpot < ApplicationRecord

	geocoded_by :address
    after_validation :geocode
    
	def address
		[street, city, state, country].compact.join(', ')
	end

	def short_address
		[street, city, state].compact.join(', ')
	end

	def status
		"green"
	end
end
