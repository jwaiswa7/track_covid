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

    class << self
        def track(args)
          raise "Not a hash type" if args.class != Hash
          imei = args[:imei]
          user = User.find_by_imei(imei)
          if !user
            user = User.create(imei: imei) 
          end
          if args[:longitude] && args[:latitude]
            longitude = args[:longitude]
            latitude = args[:latitude]
            #start sideqik worker to cehck if the user is near any location 
            TrackWorker.perform_async(user.id, longitude,latitude)
          end
        end
    end
end
