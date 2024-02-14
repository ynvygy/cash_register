require_relative '../item'

describe Item do
  describe '#initialize' do
    it 'initializes the item prices hash' do
      item = Item.instance

      expect(item.instance_variable_get(:@item_prices)).to eq({
        "GR1" => 3.11,
        "SR1" => 5.00,
        "CF1" => 11.23
      })
    end
  end

  describe '#get_price' do
    context 'when the item exists in the catalog' do
      it 'returns the correct price for GR1' do
        item = Item.instance
        price = item.get_price("GR1")
        expect(price).to eq(3.11)
      end

      it 'returns the correct price for SR1' do
        item = Item.instance
        price = item.get_price("SR1")
        expect(price).to eq(5.00)
      end

      it 'returns the correct price for CF1' do
        item = Item.instance
        price = item.get_price("CF1")
        expect(price).to eq(11.23)
      end
    end

    context 'when the item does not exist in the catalog' do
      it 'returns nil for an unknown item' do
        item = Item.instance
        price = item.get_price("UnknownItem")
        expect(price).to be_nil
      end
    end
  end
end
