require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require './lib/attendee'
require './lib/auction'

class AuctionTest < Minitest::Test

  def test_it_exists
    auction = Auction.new
    assert_instance_of Auction, auction
  end

  def test_it_starts_with_no_items
    auction = Auction.new
    assert_equal [], auction.items
  end

  def test_it_can_add_items
    auction = Auction.new
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    auction.add_item(item1)
    auction.add_item(item2)
    assert_equal [item1, item2], auction.items
  end

  def test_it_knows_item_names
    auction = Auction.new
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    auction.add_item(item1)
    auction.add_item(item2)
    expected = ["Chalkware Piggy Bank", "Bamboo Picture Frame"]
    assert_equal expected, auction.item_names
  end

  def test_can_add_item_bids
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    item3 = Item.new('Homemade Chocolate Chip Cookies')
    item4 = Item.new('2 Days Dogsitting')
    item5 = Item.new('Forever Stamps')
    attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    attendee2 = Attendee.new(name: 'Bob', budget: '$75')
    attendee3 = Attendee.new(name: 'Mike', budget: '$100')
    auction = Auction.new
    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)
    expected = {}
    assert_equal expected, item1.bids
    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)
    expected2 = {
      attendee2 => 20,
      attendee1 =>22
                }
    assert_equal expected2, item1.bids
  end

  def test_it_knows_current_highest_bid
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    item3 = Item.new('Homemade Chocolate Chip Cookies')
    item4 = Item.new('2 Days Dogsitting')
    item5 = Item.new('Forever Stamps')
    attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    attendee2 = Attendee.new(name: 'Bob', budget: '$75')
    attendee3 = Attendee.new(name: 'Mike', budget: '$100')
    auction = Auction.new
    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)
    expected = {}
    assert_equal expected, item1.bids
    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)
    assert_equal 22, item1.current_high_bid
  end
end
