require 'rails_helper'

RSpec.describe 'Customers', type: :request do
  context 'requests' do

    it 'JSON Schema' do
      get '/customers/1.json'
      expect(response).to match_json_schema('customer') # ou match_response_schema
    end

    it 'GET #Index works fine! status 200 OK!' do
      get customers_path
      expect(response).to have_http_status 200
    end

    it 'GET #Index JSON works fine! JSON OK!' do
      get '/customers.json' # No caso seriam todos os elementos (+ de 01(hum))
      expect(response.body).to include_json(
        [id:1, # Ou qq nr com expressão regular: /\d/ (veja no ex abaixo)
         name:(be_kind_of String),
         email:(be_kind_of String)] # Como é mais de 01(hum), então PRECISA do array ([])
      )
    end
    it 'GET #Show JSON works fine!' do
      get '/customers/1.json' # Aqui é um elemento somente
      expect(response.body).to include_json(
        id:/\d/ # Então NÃO precisa do arrary ([])
      )
    end

    it 'GET #Show RSpec "puro" JSON works fine!' do
      get '/customers/1.json' # Aqui é um elemento somente
       response_body = JSON.parse(response.body)
       expect(response_body.fetch("id")).to eq(1)
       expect(response_body.fetch("name")).to be_kind_of(String)
    end

    it 'POST #Create JSON works fine!' do
      member = create(:member)
      login_as(member, scope: :member)
      headers = {'ACCEPT' => 'application/json'}
      customer_params = attributes_for(:customer)
      post '/customers.json', params: {customer: customer_params}, headers: headers
      expect(response.body).to include_json(
        id: /\d/,
        name: customer_params[:name],
        email:customer_params[:email]
      )
    end

    it 'PATCH #Update JSON works fine!' do
      member = create(:member)
      login_as(member, scope: :member)
      headers = {'ACCEPT' => 'application/json'}
      customer = Customer.first
      customer.name += " - Atual"
      patch "/customers/#{customer.id}.json", params: { customer: customer.attributes }, headers: headers
      expect(response.body).to include_json(
        id: /\d/,
        name: customer.name,
        email: customer.email
      )
    end

    it 'DELETE #Destroy JSON works fine!' do
      member = create(:member)
      login_as(member, scope: :member)
      headers = {'ACCEPT' => 'application/json'}
      customer = Customer.first
      expect { delete "/customers/#{customer.id}.json", headers: headers }.
      to change(Customer, :count).by(-1)
      expect(response).to have_http_status 204
    end
  end
end