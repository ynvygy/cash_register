class Item
  @@instance = nil

  def self.instance
    @@instance ||= new
  end

  def initialize
    @item_prices = {
      "GR1" => 3.11,
      "SR1" => 5.00,
      "CF1" => 11.23
    }
  end

  def get_price(item)
    @item_prices[item]
  end
end