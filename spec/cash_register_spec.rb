require_relative '../cash_register'

describe CashRegister do
  it 'should return a total sum of 0 if nothing was added' do
    cash_register = CashRegister.new
    expect { cash_register.show_total }.to output("The total is 0.00\n").to_stdout
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
      expect { cash_register.show_total }.to output("The total is 3.11\n").to_stdout
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
      expect { cash_register.show_total }.to output("The total is 16.61\n").to_stdout
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
      expect { cash_register.show_total }.to output("The total is 30.57\n").to_stdout
    end
  end
end