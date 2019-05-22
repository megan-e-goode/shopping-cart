require 'shopping_cart'

describe 'Shopping_cart' do
  context ',when adding to basket,' do
    it 'responds the method add' do
      cart = Shopping_cart.new
      expect(cart).to respond_to(:add)
    end
  end
end
