require './lib/shopping_cart'

cart = ShoppingCart.new

cart.scan("Bread")
cart.checkout
cart.checkout_total
cart.transaction(10)
