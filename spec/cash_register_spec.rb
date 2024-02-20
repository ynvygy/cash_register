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
    # Amenitiz test cases
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

    # Tests for eight items of each
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

    # Test for no items
    it 'adds nothing and expects 0' do
      add_items([])
      expect_total_output("The total is 0.00\n")
    end

    # Tests for one item each
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

  describe '#process_menu_choice' do
    context 'when the choice is 1' do
      it 'calls add_item method' do
        expect(cash_register).to receive(:add_item)
        cash_register.send(:process_menu_choice, 1)
      end
    end

    context 'when the choice is 2' do
      it 'calls show_total method' do
        expect(cash_register).to receive(:show_total)
        cash_register.send(:process_menu_choice, 2)
      end
    end

    context 'when the choice is 3' do
      it 'prints exit message and exits the program' do
        expect(cash_register).to receive(:puts).with(CashRegister::CONFIG['exit_message'])
        expect { cash_register.send(:process_menu_choice, 3) }.to raise_error(SystemExit)
      end
    end

    context 'when the choice is invalid' do
      it 'prints invalid choice message' do
        expect(cash_register).to receive(:puts).with(CashRegister::CONFIG['invalid_choice_message'])
        cash_register.send(:process_menu_choice, 99)
      end
    end
  end

  describe '#add_item' do
    it 'adds a valid item to the cash register' do
      valid_choices = ['GR1', 'SR1', 'CF1']
      prompt_message = "Enter the name of the item: (#{valid_choices.join(' / ')})"
      invalid_prompt = "Invalid item. Please enter one of the valid items: #{valid_choices.join(', ')}"

      allow(cash_register).to receive(:gets).and_return("SR1\n")
      expect { cash_register.add_item }.to output(/SR1 added to the cash register/).to_stdout
      expect(cash_register.items).to eq(['SR1'])
    end
  end
end
