require_relative '../discount'

describe Discount do
  describe '#buy_n_get_n_free' do
    it 'calculates the total price after buy-n-get-n-free discount' do
      quantity_to_buy = 2
      quantity_to_get_free = 1
      price_per_item = 3.11

      total_price = Discount.buy_n_get_n_free(quantity_to_buy, quantity_to_get_free, price_per_item)
      expect(total_price).to eq(6.22)
    end
  end

  describe '#buy_multiple_fixed_price' do
    it 'calculates the total cost for buying multiple items' do
      quantity = 3
      price_per_item = 4.50

      total_cost = Discount.buy_multiple_fixed_price(quantity, price_per_item)
      expect(total_cost).to eq(13.50)
    end
  end

  describe '#buy_multiple_calculated_price' do
    it 'calculates the total cost for buying multiple items' do
      quantity = 3
      price_per_item = 11.23
      percentage_price = 2/3.to_f

      total_cost = Discount.buy_multiple_calculated_price(quantity, price_per_item, percentage_price)
      expect(total_cost).to eq(22.46)
    end
  end
end