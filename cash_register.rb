require 'pry'
require_relative 'item'
require_relative 'item_discount'
require_relative 'discount'

class CashRegister
  attr_reader :items

  def initialize
    @items = []
    @item_list = Item.instance
    @item_discount = ItemDiscount.instance
  end

  def add_item
    puts "Enter the name of the item: "
    item = gets.chomp

    @items << item

    puts "#{item} added to the cash register."
    puts "Current items: #{@items}"
  end

  def show_total
    total = get_item_count.sum do |item, value|
      item_price = @item_list.get_price(item).to_f
      item_discounts = @item_discount.get_discount(item)
      item_discounts.sum do |discount|
        Discount.get_discount(discount, item_price, value)
      end
    end

    puts "The total is #{sprintf("%.2f", total)}"
  end

  def get_item_count
    item_counts = Hash.new(0)

    items.each { |item| item_counts[item] += 1 }

    item_counts
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