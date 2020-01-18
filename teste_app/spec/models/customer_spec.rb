require 'rails_helper'

RSpec.describe Customer, type: :model do
  
  it 'Create Customer with #full_name, email & Aliases' do
    customer = create(:user) # => Alias para (:customer)
    expect(customer.full_name).to start_with("Sr. ")
    # puts customer.full_name.inspect
    expect(customer.email).to match(/@/)
    # puts customer.email.inspect
  end

  it'#full_name sobrescrevendo atributo => (:customer, :name "e o nome")' do
    customer = create(:customer, name: "André")
    expect(customer.full_name).to start_with("Sr. André")
    # puts customer.full_name.inspect
  end

  it'#vip (boolean)' do
    customer = create(:customer)
    expect(customer.vip).to be true
    # puts customer.vip.inspect
    expect(customer.days).to be >= 30
    # puts customer.days.inspect
  end

  it'#vip sobrescrevendo atributo (boolean)' do
    customer = create(:customer, vip: false, days: 10)
    expect(customer.vip).to be false
    # puts customer.vip.inspect
    expect(customer.days).to be < 30
    # puts customer.days.inspect
  end

  it '#vip default Herança (boolean)' do
    customer = create(:customer, :default)
    expect(customer.vip).to be false
    # puts customer.vip.inspect
    expect(customer.days).to be < 30
    # puts customer.days.inspect
  end

  it 'attributes_for' do
    attrs = attributes_for(:customer)
    attrs_d = attributes_for(:customer, :default)
    customer = Customer.create(attrs)
    expect(customer.full_name).to start_with("Sr. ")
    # puts attrs
    # puts attrs_d
    # puts customer.full_name.inspect
  end

  it 'transiente attributes' do
    customer = create(:customer, :default, upcased: true) # <= upcased é um atributo transitório 
    expect(customer.name.upcase).to eq(customer.name)
    # puts customer.name.inspect
  end

  it 'trait Default Male' do
    customer = create(:customer, :default, :male) # <= trait : male 
    expect(customer.gender).to eq('M')
    expect(customer.vip).to be false
    # puts customer.gender.inspect
    # puts customer.vip.inspect
  end

  it 'trait Vip Male' do
    customer = create(:customer, :male) # <= trait : male 
    expect(customer.gender).to eq('M')
    expect(customer.vip).to be true
    # puts customer.gender.inspect
    # puts customer.vip.inspect
  end

  it 'trait Default Female' do
    customer = create(:customer, :default, :female) # <= trait : female 
    expect(customer.gender).to eq('F')
    expect(customer.vip).to be false
    # puts customer.gender.inspect
    # puts customer.vip.inspect
  end

  it 'trait Vip Female' do
    customer = create(:customer, :female) # <= trait : female 
    expect(customer.gender).to eq('F')
    expect(customer.vip).to be true
    # puts customer.gender.inspect
    # puts customer.vip.inspect
  end

  it 'travel_to' do
    travel_to Time.zone.local(2004, 11, 24, 01, 04, 44) do
      @customer = create(:customer)
    end
    
    expect(@customer.created_at).to eq(Time.new(2004, 11, 24, 01, 04, 44))
  end
end
 