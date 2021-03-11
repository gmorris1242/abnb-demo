namespace :db do
  desc 'Updates listings'

  task update_listings: :environment do
    hosts = Host.all

    hosts.each do |host|
      enter_listings(host.host_number, host.id)
    end
  end
end

def enter_listings(host_number, host_id)
  count = 0
  listings = listing_call(count, host_number)

  while listings['user_promo_listings'].count >= 50 do
    create_listings(listings, host_id)
    listings = listing_call(count + 50, host_number)
    count = count + 50
  end

  create_listings(listings, host_id)
end

def listing_call(offset, host_number)
  url ="https://www.airbnb.com/api/v2/user_promo_listings?_limit=50&_offset=#{offset}&currency=USD&key=d306zoyjsyarp7ifhu67rjxn52tv0t20&locale=en&user_id=#{host_number}"
  HTTParty.get(url)
end

def create_listings(listings, host_id)
  listings['user_promo_listings'].each do |listing|
    existing_listing = Listing.find_or_create_by(airbnb_listing_id_str: listing['id_str'])

    existing_listing.update(
      host_id: host_id,
      name: listing['name'],
      nightly_price_as_guest: listing['nightly_price_as_guest'],
      picture_url: listing['picture_url'],
      localized_city: listing['localized_city']
    )
  end
end