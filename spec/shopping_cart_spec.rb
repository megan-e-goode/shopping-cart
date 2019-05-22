require './lib/shopping_cart.rb'

describe 'Shopping_cart' do
  context ',when adding to basket,' do
    let(:items) { double(:items, :stock => [
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
      ]) }
    let(:cart) { ShoppingCart.new(items)}

    it 'responds the method add' do
      expect(cart).to respond_to(:scan)
    end

    it 'scans the item to the checkout' do
      cart.scan("Bread")
      expect(cart.checkout).to include({ item: "Bread", price: 0.90, available: true })
    end
  end
end
