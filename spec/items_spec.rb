require 'items'

describe Items do
  it 'initilizes items list' do
    items = Items.new
    expect(items.stock).to be_an_instance_of(Array)
    expect(items.stock).to eq([
      { item: "Bread", price: 0.90 },
      { item: "Butter", price: 1.90 },
      { item: "Milk", price: 0.90 },
      { item: "Cereal", price: 2.00 },
      { item: "Ice", price: 0.50 },
      { item: "Yoghurts", price: 1.80 },
      { item: "Toilet Roll", price: 1.99 },
      { item: "Kitchen Towels", price: 1.99 },
      { item: "Salad Mix", price: 0.80 },
      { item: "Cheese", price: 2.50 }
    ])
  end
end
