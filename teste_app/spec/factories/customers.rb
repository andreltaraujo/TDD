FactoryBot.define do
  factory :customer, aliases: [:user] do # Aliases [:user]
    
    transient do
      upcased {false}
      qtd_orders {3}
    end

    name {Faker::Name.name}
    email {Faker::Internet.email}
    address {Faker::Address.street_address}
    vip {true}
    days {30}

    # sequence(:email) {|n| "Email nr: #{n} @email.com"}
    
    trait :male do
      gender {'M'}
    end
    trait :female do
      gender {'F'}
    end
    
    trait :default do
      vip {false}
      days {10}
    end

    trait :with_orders do
      after(:create) do |customer, evaluator| # <= after
        create_list(:order, evaluator.qtd_orders, customer: customer)
      end
  
    end

    after(:create) do |customer, evaluator| # <= after
      customer.name.upcase! if evaluator.upcased
    end

    # after(:build) do |customer, evaluator| <= :build
    #   customer.name.upcase! if evaluator.upcased
    # end

    # before(:create) do |customer, evaluator| <= before
    #   customer.name.upcase! if evaluator.upcased
    # end

  end
 end

#  ou declara a factory aqui e chama pelo nome da factory.
#  factory :customer_male, traits: [:male]
#  factory :customer_female, traits: [:female]
#  factory :customer_vip, traits: [:vip] <= Lembrando que neste caso tem de implementar a trait 'vip' 
#  factory :customer_defult, traits: [:default]
#  factory :customer_male_vip, traits: [:male, :vip] <= Lembrando que neste caso tem de implementar a trait 'vip' 
#  factory :customer_male_default, traits: [:male, :default ]
#  factory :customer_female_vip, traits: [:female, :vip] <= Lembrando que neste caso tem de implementar a trait 'vip' 
#  factory :customer_female_default, traits: [:female, :default]
#  factory :customer_with_orders, traits: [:with_orders]


