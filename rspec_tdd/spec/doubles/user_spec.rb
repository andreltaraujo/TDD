describe 'Teste double' do
  
  it '--' do
    user = double('User')
    allow(user).to receive_messages(name: 'André', password: 'secret') # =>Ou assim
    allow(user).to receive(:name).and_return('André') # =>Ou assim, só que só aceita um argumento
    allow(user).to receive(:password).and_return('secret')
    puts user.name
    puts user.password
  end

  it 'as_null_object' do
    user = double('User').as_null_object
    allow(user).to receive_messages(name: 'André', password: 'secret') # =>Ou assim
    allow(user).to receive(:name).and_return('André') # =>Ou assim, só que só aceita um argumento
    allow(user).to receive(:password).and_return('secret')
    puts user.name
    puts user.password
    puts user.email
  end
end