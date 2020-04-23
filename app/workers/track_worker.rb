class TrackWorker
  include Sidekiq::Worker

  def perform(user, longitude, latitude)
  	longitude = longitude.to_f
  	latitude = latitude.to_f
  	puts "long: #{longitude}, lat: #{latitude}"
    # Do something
  end
end

#[0.0574621,32.4728272]
