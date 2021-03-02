require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require './lib/attendee'
require './lib/auction'

class AuctionTest < Minitest::Test
  def setup
    @auction = Auction.new
  end

  def test_it_exists
    assert_instance_of Auction, @auction
  end

  def test_it_starts_with_no_items
    assert_equal [], @auction.items
  end
end
