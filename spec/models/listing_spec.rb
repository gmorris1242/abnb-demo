require 'rails_helper'

describe Listing do
  it 'has a valid factory' do
    expect(build(:listing)).to be_valid
  end

  it { should validate_presence_of(:airbnb_listing_id_str) }
  it { should belong_to(:host) }

  it 'Makes a call to set calendar' do
    stub_request(:get, "https://www.airbnb.com/api/v2/user_promo_listings?_limit=50&_offset=0&currency=USD&key=d306zoyjsyarp7ifhu67rjxn52tv0t20&locale=en&user_id=1234").
      with(
        headers: {
       'Accept'=>'*/*',
       'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       'User-Agent'=>'Ruby'
        }).
      to_return(status: 200, body: "", headers: {})

    stub_request(:get, "https://www.airbnb.com/api/v3/PdpAvailabilityCalendar?_cb=1ufa5s18y1tvf&currency=USD&extensions=%7B%22persistedQuery%22:%7B%22version%22:1,%22sha256Hash%22:%22dc360510dba53b5e2a32c7172d10cf31347d3c92263f40b38df331f0b363ec41%22%7D%7D&key=d306zoyjsyarp7ifhu67rjxn52tv0t20&locale=en&operationName=PdpAvailabilityCalendar&variables=%7B%22request%22:%7B%22count%22:12,%22listingId%22:%224321%22,%22month%22:3,%22year%22:2021%7D%7D").
      with(
        headers: {
       'Accept'=>'*/*',
       'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       'User-Agent'=>'Ruby'
        }).
      to_return([status: 200, body: "", headers: {}])

      listing = create(:listing)

      expect(listing.reload.calendar).to eq([])
  end
end
