class Movement < ApplicationRecord
  belongs_to :user
  belongs_to :hot_spot

  def address
  	hot_spot.short_address
  end
end
