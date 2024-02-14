require 'pry'
require_relative 'item'

class CashRegister
  attr_reader :items

  def initialize
    @items = []
    @item_list = Item.instance
  end

  def add_item
    puts "Enter the name of the item: "
    item = gets.chomp

    @items << item

    puts "#{item} added to the cash register."
    puts "Current items: #{@items}"
  end

  def show_total
    total = @items.sum { |item| @item_list.get_price(item).to_f }
    puts "The total is #{sprintf("%.2f", total)}"
  end

  def display_menu
    puts "Menu:"
    puts "1. Add Item"
    puts "2. Show Total"
    puts "3. Quit"
  end

  def process_menu_choice(choice)
    case choice
    when 1
      add_item
    when 2
      show_total
    when 3
      puts "Exiting the cash register. Thank you!"
      exit
    else
      puts "Invalid choice. Please choose a valid option."
    end
  end

  def run_menu
    loop do
      display_menu
      puts "Enter your choice (1-3): "
      choice = gets.to_i
      process_menu_choice(choice)
    end
  end
end

if __FILE__ == $0
  cash_register = CashRegister.new
  cash_register.run_menu
end