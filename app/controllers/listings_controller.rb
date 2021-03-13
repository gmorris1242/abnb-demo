class ListingsController < ApplicationController
  def index
    if params[:host_id]
      @host = Host.find(params[:host_id])
      @listings = @host.listings
    else
      @listings = Listing.all
    end

    rescue ActiveRecord::RecordNotFound
      redirect_to hosts_path
  end

  def show
    @listing = Listing.find(params[:id])
    @listing.set_calendar
  end
end
