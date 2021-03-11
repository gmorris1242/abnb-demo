# == Schema Information
#
# Table name: listings
#
#  id                     :bigint           not null, primary key
#  airbnb_listing_id_str  :string
#  localized_city         :string
#  name                   :string
#  nightly_price_as_guest :string
#  picture_url            :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  host_id                :bigint
#
# Indexes
#
#  index_listings_on_host_id  (host_id)
#
class Listing < ApplicationRecord
  belongs_to :host
  validates :airbnb_listing_id_str, presence: true, uniqueness: true

  after_create :set_calendar

  private

  def set_calendar
    url = "https://www.airbnb.com/api/v3/PdpAvailabilityCalendar?operationName=PdpAvailabilityCalendar&key=d306zoyjsyarp7ifhu67rjxn52tv0t20&locale=en&currency=USD&variables=%7B%22request%22%3A%7B%22count%22%3A12%2C%22listingId%22%3A%22#{airbnb_listing_id_str}%22%2C%22month%22%3A#{DateTime.now.month}%2C%22year%22%3A#{DateTime.now.year}%7D%7D&extensions=%7B%22persistedQuery%22%3A%7B%22version%22%3A1%2C%22sha256Hash%22%3A%22dc360510dba53b5e2a32c7172d10cf31347d3c92263f40b38df331f0b363ec41%22%7D%7D&_cb=1ufa5s18y1tvf"

    response = HTTParty.get(url)
    calendar_months = response['data']['merlin']['pdpAvailabilityCalendar']['calendarMonths'][0..2]

    dates = []

    calendar_months.each do |month|
      month['days'].each do |day|
        dates.push(
          {
            date: day['calendarDate'],
            available: day['bookable']
          }
        )
      end
    end

    self.calendar = dates
    self.save
  end
end
