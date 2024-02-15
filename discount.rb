class Discount
  def self.get_discount(item_discounts, item_price, count)
    case item_discounts['discount_type']
    when 'buy_n_get_n_free'
      buy_n_get_n_free(item_discounts, item_price, count)
    when 'buy_multiple_fixed_price'
      buy_multiple_fixed_price(item_discounts, item_price, count)
    when 'buy_multiple_calculated_price'
      buy_multiple_calculated_price(item_discounts, item_price, count)
    else
      raise ArgumentError, "Invalid discount type: #{item_discounts['discount_type']}"
    end
  end

  def self.buy_n_get_n_free(item_discounts, item_price, count)
    (count / item_discounts['get_quantity']) * (item_discounts['buy_quantity'] * item_price).round(2) + (count % item_discounts['get_quantity']) * item_price
  end

  def self.buy_multiple_fixed_price(item_discounts, item_price, count)
    return count * item_price if count < item_discounts['minimum_amount']

    (count * item_discounts['fixed_price']).round(2)
  end

  def self.buy_multiple_calculated_price(item_discounts, item_price, count)
    return count * item_price if count < item_discounts['minimum_amount']

    (count * item_price * item_discounts['percentage_price']).round(2)
  end
end