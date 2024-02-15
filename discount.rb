class Discount
  def self.get_discount(item_discounts, item_price, count)
    case item_discounts['discount_type']
    when 'buy_n_get_n_free'
      (count / item_discounts['get_quantity']) * buy_n_get_n_free(item_discounts['buy_quantity'], item_discounts['get_quantity'], item_price) + (count % item_discounts['get_quantity']) * item_price
    when 'buy_multiple_fixed_price'
      return buy_multiple_fixed_price(count, item_discounts['fixed_price']) if count >= item_discounts['minimum_amount']
      count * item_price
    when 'buy_multiple_calculated_price'
      return buy_multiple_calculated_price(count, item_price, item_discounts['percentage_price']) if count >= item_discounts['minimum_amount']
      count * item_price
    else
      raise ArgumentError, "Invalid discount type: #{item_discounts['discount_type']}"
    end
  end

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