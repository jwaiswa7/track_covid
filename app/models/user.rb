class User < ApplicationRecord
	has_many :movements
	has_many :hot_spots,  through: :movements
end
