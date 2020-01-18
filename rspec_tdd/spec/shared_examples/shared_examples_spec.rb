require 'pessoa'

shared_examples 'status' do |felling| # =>Chegando/Recebendo sem a exclamação!!
  it "#{felling}" do
    pessoa.send("#{felling}!") # =>Inserindo a exclamação aqui !!!
    expect(pessoa.status).to eq("Sentindo-se #{felling.capitalize}!") # =>Inserindo a exclamação aqui também !!!
  end
end

  describe 'pessoa' do
    subject(:pessoa) { Pessoa.new }

    include_examples 'status', :feliz # =>Enviando sem a exclamação!!!
    it_behaves_like 'status', :triste # =>Enviando sem a exclamação!!!
    it_should_behave_like 'status', :contente # =>Enviando sem a exclamação!!!
    
    # it 'feliz!' do
    #   pessoa.feliz!
    #   expect(pessoa.status).to eq("Sentindo-se Feliz!")
    # end

    # it 'triste!' do
    #   pessoa.triste!
    #   expect(pessoa.status).to eq("Sentindo-se Triste!")
    # end

    # it 'contente!' do
    #   pessoa.contente!
    #   expect(pessoa.status).to eq("Sentindo-se Contente!")
    # end
  end