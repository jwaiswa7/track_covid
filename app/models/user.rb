class User < ApplicationRecord
	has_many :movements
	has_many :hot_spots,  through: :movements

	validates :status, inclusion: { in: %w[green yellow red] }, allow_nil: false
    

    def contact!
    	update_attributes(status: "yellow")
    end

    def infected!
    	update_attributes(status: "red")
    end

    def safe!
    	update_attributes(status: "green")
    end
end
