# == Schema Information
#
# Table name: hosts
#
#  id            :bigint           not null, primary key
#  about         :text
#  first_name    :string
#  host_number   :string
#  last_name     :string
#  location      :string
#  picture_url   :string
#  thumbnail_url :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Host < ApplicationRecord
  has_many :listings, dependent: :destroy
  validates :host_number, presence: true, uniqueness: true

  after_commit :enter_listings

  private

  def enter_listings
    count = 0
    listings = listing_call(count)

    if (listings['user_promo_listings'])
      while listings['user_promo_listings'].count >= 50 do
        create_listings(listings)
        listings = listing_call(count + 50)
        count = count + 50
      end

      create_listings(listings)
    end
  end

  def listing_call(offset)
    url ="https://www.airbnb.com/api/v2/user_promo_listings?_limit=50&_offset=#{offset}&currency=USD&key=d306zoyjsyarp7ifhu67rjxn52tv0t20&locale=en&user_id=#{host_number}"
    HTTParty.get(url)
  end

  def create_listings(listings)
    listings['user_promo_listings'].each do |listing|
      new_listing = Listing.new(
        host_id: id,
        name: listing['name'],
        nightly_price_as_guest: listing['nightly_price_as_guest'],
        picture_url: listing['picture_url'],
        localized_city: listing['localized_city'],
        airbnb_listing_id_str: listing['id_str'],
      )

      if new_listing.save
        puts 'SAVED'
      else
        puts "ERROR: #{new_listing['airbnb_listing_id_str']}"
      end
    end
  end


end
