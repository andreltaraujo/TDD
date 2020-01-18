require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'belongs_to' do
    order = create(:order)
    expect(order.customer).to be_kind_of(Customer)
    # puts order.description
    # puts "Customer id: #{order.customer.id}"
    # puts "Customer name: #{order.customer.full_name}"
  end

  it 'order create_list' do
    orders = create_list(:order, 3) # <=Cria quantos você definir
    expect(orders.count).to be == 3
    orders.each do |o|
      # puts o.description
      # puts "Customer id: #{o.customer.id}"
      # puts "Customer name: #{o.customer.full_name}"
    end
  end

    it 'order create_pair' do
      orders = create_pair(:order) # <=Cria 2
      expect(orders.count).to be == 2
      orders.each do |o|
        # puts o.description
        # puts "Customer id: #{o.customer.id}"
        # puts "Customer name: #{o.customer.full_name}"
      end
    end

  it 'has_many' do
    customer = create(:customer, :with_orders) # <= trait : with_orders 
    expect(customer.orders.count).to be == 3
    # puts customer.orders.inspect
  end

  it 'has_many sobrescrevendo transiente attribute' do
    customer = create(:customer, :with_orders, qtd_orders: 5) # <= trait : with_orders 
    expect(customer.orders.count).to eq(5)
    # puts customer.inspect
    # puts customer.orders.inspect
  end

end
