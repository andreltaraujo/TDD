describe 'HTTParty' do
  #it 'content_type', vcr: { cassette_name: 'jsonplaceholder/posts',
  #:match_requests_on => [:body]} do # Com metadados RSpec declara o :vcr aqui
  # e se tem uma URL não deterministica usa o match_request.

  it 'content_type', vcr: { cassette_name: 'jsonplaceholder/posts', :record => :new_episodes } do # Com metadados RSpec declara o :vcr aqui

    # Webmock aproach
    #stub_request(:get, "https://jsonplaceholder.typicode.com/posts/1").
    #  to_return(status: 200, body: "", headers: {'content-type': 'application/json'})

    # Sem metadados RSpec faz assim, como abaixo na linha comentada
    # VCR.use_cassette("jsonplaceholder/posts") do
      response = HTTParty.get('https://jsonplaceholder.typicode.com/posts/1')
      content_type = response.headers['content-type']
      expect(content_type).to match(/json/)
    # end
  end
end