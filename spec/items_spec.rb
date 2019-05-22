require 'items'

describe Items do
  let(:items) { Items.new }
  it 'initilizes items list' do
    expect(items.stock).to eq([
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
    ])
  end

  it 'checks if item is available' do
    item = items.stock.select { |item| item[:item] == "Bread" }
    expect(items.available?(item[0])).to be true
  end

  it 'displays list of items with their prices' do
    expect(items.view).to eq([
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
    ])
  end
end
