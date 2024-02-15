# cash_register_spec.rb
require_relative '../cash_register'

describe CashRegister do
  let(:cash_register) { CashRegister.new }

  def add_items(items)
    items.each do |item|
      allow(cash_register).to receive(:gets).and_return("#{item}\n")
      cash_register.add_item
    end
  end

  def expect_total_output(expected_output)
    expect { cash_register.show_total }.to output(expected_output).to_stdout
  end

  describe '#add_item' do
    it 'adds GR1 twice and shows the total correctly (Test Data Amenitiz #1)' do
      add_items(["GR1", "GR1"])
      expect_total_output("The total is 3.11\n")
    end

    it 'adds SR1 three times and GR1 once and shows the total correctly (Test Data Amenitiz #2)' do
      add_items(["SR1", "SR1", "GR1", "SR1"])
      expect_total_output("The total is 16.61\n")
    end

    it 'adds CF1 three times and GR1 and SR1 both once and shows the total correctly (Test Data Amenitiz #3)' do
      add_items(["GR1", "CF1", "SR1", "CF1", "CF1"])
      expect_total_output("The total is 30.57\n")
    end
  end
end
