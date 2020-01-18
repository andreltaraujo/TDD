FactoryBot.define do
  factory :order do
    sequence(:description) { |n| "Pedido nr: #{n}" }
    customer
    # ou assim: =>association: :customer, factory: :customer 
  end
end
