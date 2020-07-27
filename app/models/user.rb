class User < ApplicationRecord
  has_many :movements
  has_many :hot_spots, -> { distinct }, through: :movements

  validates :status, inclusion: { in: %w[green yellow red] }, allow_nil: false

  def contact!
    update_attributes(status: 'yellow')
  end

  def infected!
    update_attributes(status: 'red')
  end

  def safe!
    update_attributes(status: 'green')
  end

  class << self
    def track(args)
      Rails.logger.debug "User #{args}"
      # raise "Not a hash type" if args.class != Hash
      imei = args['imei']
      user = User.find_by(imei: imei)
      user ||= User.create(imei: imei)
      Rails.logger.debug "User being asked: #{user.to_json}"
      if args['longitude'] && args['latitude']
        longitude = args['longitude']
        latitude = args['latitude']
        # start sideqik worker to cehck if the user is near any location
        TrackWorker.perform_async(user.id, longitude, latitude)
        user
      end
    end
  end
end
