class HotSpotsController < ApplicationController
  before_action :authenticate_member!
  def index
    @hotspots = HotSpot.all
  end
end
