class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    authorize
    @listing = Listing.find(params[:listing_id])
    @booking = @listing.bookings.build
  end

  def create
    @booking = Booking.new(listing_id: params[:listing_id], state: "pending", user: current_user, start_on: params[:start_on], end_on: params[:end_on])
    if @booking.save
      redirect_to current_user
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to @booking 
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private
    def booking_params
      params.require(:booking).permit(:state, :user_id, :listing_id, :start_on, :end_on)
    end

end









