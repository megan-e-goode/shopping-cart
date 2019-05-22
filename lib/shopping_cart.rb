require './lib/items.rb'

class ShoppingCart
  attr_reader :checkout, :items, :total

  def initialize(items=Items.new)
    @checkout = []
    @items = items
  end

  def scan(item)
    scanned_item = @items.stock.select { |product| product[:item] == item }
    add_to_checkout(scanned_item)
  end

  def add_to_checkout(scanned_item)
    raise "Item is out of stock" unless @items.available?(scanned_item[0])
    @checkout.push(scanned_item[0])
  end

  def checkout_total
    total = 0
    @checkout.each do |item|
      total += item[:price]
    end
    puts "Total: £#{'%.2f' % total}"
    @total = total
  end

  def transaction(payment)
    change = payment - @total
    puts "Paid with £#{'%.2f' % payment}, Change: £#{'%.2f' % change}"
    ('%.2f' % change).to_f
  end
end
