class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  def unpopular_items
    @items.find_all do |item|
      item.bids == {}
    end
  end

  def potential_revenue
    high_bids = []
    @items.each do |item|
      high_bids << item.current_high_bid
      # require 'pry'; binding.pry
    end
    high_bids.compact.sum
  end
end
