require 'rails_helper'

RSpec.describe Product, type: :model do
  
  # O teste é feito assim: Quando não usamos a gem ShouldaMatchers
  # it 'when description NOT present, this is an INvalid model' do
  #   product = build(:product, description: nil)
  #   product.valid?
  #   expect(product.errors[:description]).to include("can't be blank") # <= If I18n, so em pt-BR.
  # end

  # it 'when price NOT present, this is an INvalid model' do
  #   product = build(:product, price: nil)
  #   product.valid?
  #   expect(product.errors[:price]).to include("can't be blank") # <= If I18n, so em pt-BR.
  # end

  # it 'when category NOT present, this is an INvalid model' do
  #   product = build(:product, category: nil)
  #   product.valid?
  #   expect(product.errors[:category]).to include("can't be blank") # <= If I18n, so em pt-BR.
  # end
  # =>Com a gem ShouldaMatchers fica mais simples como demonstrado abaixo:

  it 'when description, price and category present, this is a valid model' do
    product = create(:product)
    expect(product).to be_valid
  end

  # =>Simplificado assim com a gem ShouldaMatchers
  
  context 'Validations' do 
    it { should validate_presence_of(:category) }
    it { is_expected.to validate_presence_of(:description) } # <=Ou assim também "is_expected.to"
    it { should validate_presence_of(:price) }
  end
  
  context 'Associations' do
    it { is_expected.to belong_to(:category) }
  end

  context 'Methods' do
    it '#full_description' do
      product = create(:product)
      expect(product.full_description).to eq("#{product.description} - #{product.price}")
    end
  end
end
