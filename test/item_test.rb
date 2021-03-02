require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require './lib/attendee'
require './lib/auction'

class ItemTest < Minitest::Test
  def setup
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
  end

  def test_it_exists
    assert_instance_of Item, @item1
    assert_instance_of Item, @item2
  end

  def test_is_has_attributes
    assert_equal "Chalkware Piggy Bank", @item1.name
    assert_equal "Bamboo Picture Frame", @item2.name
  end

  def test_it_can_add_bids
    attendee2 = Attendee.new(name: 'Bob', budget: '$75')
    @item1.add_bid(attendee2, 20)
    expected = {
                attendee2 => 20
                }
    assert_equal expected, @item1.bids
  end

  def test_it_knows_current_highest_bid
    attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    attendee2 = Attendee.new(name: 'Bob', budget: '$75')
    @item1.add_bid(attendee2, 20)
    @item1.add_bid(attendee1, 22)
    assert_equal 22, @item1.current_high_bid
  end
end
