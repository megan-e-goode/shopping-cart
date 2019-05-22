class Items
  attr_reader :stock

  def initialize
    @stock = [
      { item: "Bread", price: 0.90, available: true },
      { item: "Butter", price: 1.90, available: true },
      { item: "Milk", price: 0.90, available: true },
      { item: "Cereal", price: 2.00, available: true },
      { item: "Ice", price: 0.50, available: true },
      { item: "Yoghurts", price: 1.80, available: true },
      { item: "Toilet Roll", price: 1.99, available: true },
      { item: "Kitchen Towels", price: 1.99, available: true },
      { item: "Salad Mix", price: 0.80, available: true },
      { item: "Cheese", price: 2.50, available: true }
    ]
  end

  def view
    @stock.each do |item|
      puts "#{item[:item]}: £#{'%.2f' % item[:price]}"
    end
  end

  def available?(item)
    item[:available]
  end
end
