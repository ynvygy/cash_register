class ItemDiscount
  attr_reader :discounts

  def initialize
    @discounts = {
      'GR1' => [
        {
          "discount_type" => 'buy_n_get_n_free',
          "buy_quantity" => 2,
          "get_quantity" => 1
        }
      ],
      'SR1' => [
        {
          "discount_type" => 'buy_multiple_fixed_price',
          "minimum_amount" => 3,
          "fixed_price" => 4.5
        }
      ],
      'CF1' => [
        {
          "discount_type" => 'buy_multiple_calculated_price',
          "minimum_amount" => 3,
          "fixed_price" => 2/3.to_f
        }
      ]
    }
  end

  def get_discount(item)
    @discounts[item]
  end
end