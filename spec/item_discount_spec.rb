require_relative '../item_discount'

describe ItemDiscount do
  let(:item_discount) { ItemDiscount.new }

  describe '#get_discount' do
    context 'when item has discounts' do
      it 'returns the correct discounts for GR1' do
        discounts = item_discount.get_discount('GR1')

        expect(discounts).to eq([
          {
            'discount_type' => 'buy_n_get_n_free',
            'buy_quantity' => 1,
            'get_quantity' => 2
          }
        ])
      end

      it 'returns the correct discounts for SR1' do
        discounts = item_discount.get_discount('SR1')

        expect(discounts).to eq([
          {
            'discount_type' => 'buy_multiple_fixed_price',
            'minimum_amount' => 3,
            'fixed_price' => 4.5
          }
        ])
      end

      it 'returns the correct discounts for CF1' do
        discounts = item_discount.get_discount('CF1')

        expect(discounts).to eq([
          {
            'discount_type' => 'buy_multiple_calculated_price',
            'minimum_amount' => 3,
            'percentage_price' => 2 / 3.to_f
          }
        ])
      end
    end

    context 'when item has no discounts' do
      it 'returns nil for an item without discounts' do
        discounts = item_discount.get_discount('ABC')

        expect(discounts).to be_nil
      end
    end
  end
end