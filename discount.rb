class Discount
  def initialize(item_discount, item_price, count)
    @item_discount = item_discount
    @item_price = item_price
    @count = count
  end

  def get_discount
    case @item_discount['discount_type']
    when 'buy_n_get_n_free'
      buy_n_get_n_free
    when 'buy_multiple_fixed_price'
      buy_multiple_fixed_price
    when 'buy_multiple_calculated_price'
      buy_multiple_calculated_price
    else
      raise ArgumentError, "Invalid discount type: #{@item_discount['discount_type']}"
    end
  end

  def buy_n_get_n_free
    get_number_of_sets * get_discounted_quantity.round(2) + get_number_of_leftovers * @item_price
  end

  def buy_multiple_fixed_price
    return get_count_times_price if @count < @item_discount['minimum_amount']

    (@count * @item_discount['fixed_price']).round(2)
  end

  def buy_multiple_calculated_price
    return get_count_times_price if @count < @item_discount['minimum_amount']

    (get_count_times_price * @item_discount['percentage_price']).round(2)
  end

  def get_number_of_sets
    @count / @item_discount['get_quantity']
  end

  def get_number_of_leftovers
    @count % @item_discount['get_quantity']
  end

  def get_discounted_quantity
    @item_discount['buy_quantity'] * @item_price
  end

  def get_count_times_price
    @count * @item_price
  end
end