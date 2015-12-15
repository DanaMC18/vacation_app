class User < ActiveRecord::Base
  has_secure_password
  has_many :listings
  has_many :bookings

  def requested_bookings
    listings.map{|listing| listing.bookings}
  end
end