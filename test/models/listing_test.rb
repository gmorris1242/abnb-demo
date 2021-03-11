# == Schema Information
#
# Table name: listings
#
#  id                     :bigint           not null, primary key
#  airbnb_listing_id_str  :string
#  calendar               :json
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
require 'test_helper'

class ListingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
