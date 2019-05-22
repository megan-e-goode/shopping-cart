require './lib/shopping_cart.rb'

describe ShoppingCart do
  let(:items) { double(:items, :available? => true, :stock => [
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

  context 'when adding to checkout' do
    let(:unavailable_items) { double(:items, :available? => false) }
    let(:cart_unavailable) { ShoppingCart.new(unavailable_items) }

    it 'scans the item to the checkout' do
      cart.scan("Bread")
      expect(cart.checkout).to include({ item: "Bread", price: 0.90, available: true })
    end

    it 'raises error if item is unavailable' do
      scanned_item = { item: "Bread", price: 0.90, available: true }
      expect{cart_unavailable.add_to_checkout(scanned_item)}.to raise_error "Item is out of stock"
    end
  end

  context 'when at checkout' do
    it 'gets the sum of all items at checkout' do
      cart.checkout.push(
        { item: "Bread", price: 0.90, available: true },
        { item: "Butter", price: 1.90, available: true },
        { item: "Ice", price: 0.50, available: true },
        { item: "Yoghurts", price: 1.80, available: true },
        { item: "Toilet Roll", price: 1.99, available: true },
        { item: "Cheese", price: 2.50, available: true }
      )
      cart.checkout_total
      expect(cart.total).to eq(9.59)
    end

    it 'gives correct change in transaction' do
      cart.checkout.push(
        { item: "Bread", price: 0.90, available: true },
        { item: "Butter", price: 1.90, available: true },
        { item: "Ice", price: 0.50, available: true },
        { item: "Yoghurts", price: 1.80, available: true },
        { item: "Toilet Roll", price: 1.99, available: true },
        { item: "Cheese", price: 2.50, available: true }
      )
      cart.checkout_total
      expect(cart.transaction(10)).to eq(0.41)
    end
  end
end
