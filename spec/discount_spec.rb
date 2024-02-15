require_relative '../discount'

describe Discount do
  describe '#buy_n_get_n_free' do
    it 'calculates the total price after buy-n-get-n-free discount' do
      item_discounts = {
        'discount_type' => 'buy_n_get_n_free',
        'buy_quantity' => 1,
        'get_quantity' => 2
      }
      item_price = 3.11
      count = 3

      total_price = Discount.new(item_discounts, item_price, count).get_discount
      expect(total_price).to eq(6.22)
    end
  end

  describe '#buy_multiple_fixed_price' do
    it 'calculates the total cost for buying multiple items' do
      item_discounts = {
        'discount_type' => 'buy_multiple_fixed_price',
        'minimum_amount' => 3,
        'fixed_price' => 4.50
      }

      item_price = 5

      total_cost = Discount.new(item_discounts, item_price, 3).get_discount
      expect(total_cost).to eq(13.50)
    end
  end

  describe '#buy_multiple_calculated_price' do
    it 'calculates the total cost for buying multiple items' do
      item_discounts = {
        'discount_type' => 'buy_multiple_calculated_price',
        'minimum_amount' => 3,
        'percentage_price' => 2/3.to_f
      }

      item_price = 11.23

      total_cost = Discount.new(item_discounts, item_price, 3).get_discount
      expect(total_cost).to eq(22.46)
    end
  end
end