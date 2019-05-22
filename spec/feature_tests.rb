require './lib/items'

items = Items.new

items.add_to_cart("Bread")

items.stock.select { |item| item[:item] == "Bread" }
