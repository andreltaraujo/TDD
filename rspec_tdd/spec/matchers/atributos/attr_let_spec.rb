require 'pessoa'

describe 'Atributos' do
  
  let(:pessoa) { Pessoa.new }# Esta linha acima corresponde a => @pessoa = Pessoa.new

  it 'have_attributes' do
    pessoa.nome = "André"
    pessoa.idade = 46

    expect(pessoa).to have_attributes(nome: "André", idade: 46)
  end
end