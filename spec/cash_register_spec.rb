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

  describe '#show_total' do
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

    it 'adds GR1 eight times and shows the total correctly' do
      add_items(["GR1", "GR1", "GR1", "GR1", "GR1", "GR1", "GR1", "GR1"])
      expect_total_output("The total is 12.44\n")
    end

    it 'adds SR1 eight times and shows the total correctly' do
      add_items(["SR1", "SR1", "SR1", "SR1", "SR1", "SR1", "SR1", "SR1"])
      expect_total_output("The total is 36.00\n")
    end

    it 'adds CF1 eight times and shows the total correctly' do
      add_items(["CF1", "CF1", "CF1", "CF1", "CF1", "CF1", "CF1", "CF1"])
      expect_total_output("The total is 59.89\n")
    end

    it 'adds nothing and expects 0' do
      add_items([])
      expect_total_output("The total is 0.00\n")
    end

    it 'adds GR1 eight times and shows the total correctly' do
      add_items(["GR1"])
      expect_total_output("The total is 3.11\n")
    end

    it 'adds SR1 eight times and shows the total correctly' do
      add_items(["SR1"])
      expect_total_output("The total is 5.00\n")
    end

    it 'adds CF1 eight times and shows the total correctly' do
      add_items(["CF1"])
      expect_total_output("The total is 11.23\n")
    end
  end
end
