class TrackWorker
  include Sidekiq::Worker

  def perform(user, longitude, latitude)
    user = User.find(user)
    longitude = longitude.to_f
    latitude = latitude.to_f
    located = HotSpot.near([latitude, longitude], 0.02, units: :km) # Find saved locations within 0.02 of a km
    located.each do |l|
      Movement.create(user: user, hot_spot: l)
    end
    # Do something
  end
end
