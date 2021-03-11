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
require 'test_helper'

class HostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
