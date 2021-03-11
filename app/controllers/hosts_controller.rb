class HostsController < ApplicationController
  def index
    @hosts = Host.all
  end

  def new
    @host = Host.new
  end

  def create
    url = "https://www.airbnb.com/api/v2/users?currency=USD&key=d306zoyjsyarp7ifhu67rjxn52tv0t20&locale=en&user_ids=#{host_params[:host_number]}&role=all"
    response = HTTParty.get(url)

    @host = Host.new(
      about: response['users'].first['about'],
      first_name: response['users'].first['first_name'],
      host_number: host_params[:host_number],
      last_name: response['users'].first['first_name'],
      location: response['users'].first['location'],
      picture_url: response['users'].first['picture_url'],
      thumbnail_url: response['users'].first['thumbnail_url']
    )

    if @host.save
      flash[:notice] = 'Host has been created'
      redirect_to hosts_path
    else
      flash.now[:error] = 'There was an error'
      render :new
    end
  end

  def show
    @host = Host.find(params[:id])
  end

  private

  def host_params
    params.require(:host).permit(:host_number)
  end
end
