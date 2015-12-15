class ListingsController < ApplicationController

  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(image_url: params[:image_url], address: params[:address], neighborhood: params[:neighborhood], description: params[:description], price_per_night: params[:price_per_night],nickname: params[:nickname], user: current_user)
    if @listing.save
      redirect_to '/listings'
    else
      render :new
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)
    redirect_to @listing
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to listings_path
  end

  def search 
    query_neighborhood = params[:q]
    @listings = Listing.all.select { |listing| listing.neighborhood.include? query_neighborhood }
    render :index
  end

  # private
  #   def listing_params
  #     params.require(:listings).permit(:image_url, :address, :neighborhood, :description, :price_per_night)
  #   end

end











