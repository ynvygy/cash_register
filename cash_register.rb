require 'pry'
require_relative 'item'
require_relative 'item_discount'
require_relative 'discount'
require 'yaml'

class CashRegister
  attr_reader :items

  CONFIG = YAML.load_file('config.yml')

  def initialize
    @items = []
    @item = Item.new
    @item_discount = ItemDiscount.new
  end

  def add_item
    item = nil
    loop do
      puts format(CONFIG['choices_prompt'], choices: format_choices)
      item = gets.chomp

      break if get_choices.include?(item)

      puts format(CONFIG['invalid_prompt'], choices: format_choices)
    end

    @items << item

    puts format(CONFIG['item_added_message'], item: item)
    puts format(CONFIG['current_items_message'], items: @items.join(', '))
  end

  def calculate_total
    get_item_count.sum do |item, value|
      item_price = @item.get_price(item).to_f
      item_discounts = @item_discount.get_discount(item)
      item_discounts.sum { |discount|
        Discount.new(discount, item_price, value).get_discount
      }
    end
  end

  def show_total
    puts format(CONFIG['total_message'], total: sprintf("%.2f", calculate_total))
  end

  def get_item_count
    item_counts = Hash.new(0)

    items.each { |item| item_counts[item] += 1 }

    item_counts
  end

  def display_menu
    puts CONFIG['menu_header']
    puts CONFIG['add_item_option']
    puts CONFIG['show_total_option']
    puts CONFIG['quit_option']
  end

  def process_menu_choice(choice)
    case choice
    when 1
      add_item
    when 2
      show_total
    when 3
      puts CONFIG['exit_message']
      exit
    else
      puts CONFIG['invalid_choice_message']
    end
  end

  def run_menu
    loop do
      puts CONFIG['menu_choice_prompt']
      display_menu
      choice = gets.to_i
      process_menu_choice(choice)
    end
  end

  def get_choices
    @item.item_list
  end

  def format_choices
    get_choices.join(' / ')
  end
end

if __FILE__ == $0
  cash_register = CashRegister.new
  cash_register.run_menu
end