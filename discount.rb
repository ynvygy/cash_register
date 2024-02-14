class Discount
  def self.buy_n_get_n_free(quantity_to_buy, quantity_to_get_free, price_per_item)
    total_items = quantity_to_buy + quantity_to_get_free
    (quantity_to_buy * price_per_item).round(2)
  end

  def self.buy_multiple_fixed_price(quantity, price_per_item)
    (quantity * price_per_item).round(2)
  end

  def self.buy_multiple_calculated_price(quantity, price_per_item, percentage)
    (quantity * price_per_item * percentage).round(2)
  end
end