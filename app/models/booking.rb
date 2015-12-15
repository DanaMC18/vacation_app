class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing

  def owner
    listing.user
  end

  def is_pending?
    state == "pending"
  end

end