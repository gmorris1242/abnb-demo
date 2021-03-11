class ListingsController < ApplicationController
  def index
    @listings = Host.find(params[:host_id]).listings

    rescue ActiveRecord::RecordNotFound
      redirect_to hosts_path

  end

  def show
    @listing = Listing.find(params[:id])
  end
end
