require_relative '../cash_register'

describe CashRegister do
  it 'should be instantiated with a starting balance of 0' do
    cash_register = CashRegister.new
    expect(cash_register.balance).to eq(0)
  end

  describe '#add_item' do
    it 'adds GR1 twice and shows the total correctly (Test Data Amenitiz #1)' do
      cash_register = CashRegister.new

      # Adding GR1 for the first time
      allow(cash_register).to receive(:gets).and_return("GR1\n")
      cash_register.add_item

      # Adding GR1 for the second time
      allow(cash_register).to receive(:gets).and_return("GR1\n")
      cash_register.add_item

      # Expect the total to be the sum of the prices
      expect(cash_register.show_total).to eq(3.11)
    end

    it 'adds SR1 three times and GR1 once and shows the total correctly (Test Data Amenitiz #2)' do
      cash_register = CashRegister.new

      # Adding SR1 for the first time
      allow(cash_register).to receive(:gets).and_return("SR1\n")
      cash_register.add_item

      # Adding SR1 for the second time
      allow(cash_register).to receive(:gets).and_return("SR1\n")
      cash_register.add_item

      # Adding GR1 for the first time
      allow(cash_register).to receive(:gets).and_return("GR1\n")
      cash_register.add_item

      # Adding SR1 for the third time
      allow(cash_register).to receive(:gets).and_return("SR1\n")
      cash_register.add_item

      # Expect the total to be the sum of the prices
      expect(cash_register.show_total).to eq(16.61)
    end

    it 'adds CF1 three times and GR1 and SR1 both once and shows the total correctly (Test Data Amenitiz #3)' do
      cash_register = CashRegister.new

      # Adding GR1 for the first time
      allow(cash_register).to receive(:gets).and_return("GR1\n")
      cash_register.add_item

      # Adding CF1 for the first time
      allow(cash_register).to receive(:gets).and_return("CF1\n")
      cash_register.add_item

      # Adding SR1 for the first time
      allow(cash_register).to receive(:gets).and_return("SR1\n")
      cash_register.add_item

      # Adding CF1 for the second time
      allow(cash_register).to receive(:gets).and_return("CF1\n")
      cash_register.add_item

      # Adding CF1 for the third time
      allow(cash_register).to receive(:gets).and_return("CF1\n")
      cash_register.add_item

      # Expect the total to be the sum of the prices
      expect(cash_register.show_total).to eq(30.57)
    end
  end
end