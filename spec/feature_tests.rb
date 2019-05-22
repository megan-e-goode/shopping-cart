require './lib/shopping_cart'

cart = ShoppingCart.new

cart.scan("Bread")
puts cart.checkout

 cart.items.view
