require 'pessoa'

describe 'Atributos' do
  
  around(:each) do |teste|
    @pessoa = Pessoa.new   
    teste.run
  end
  
    it 'have_attributes' do
      @pessoa.nome = "André"
      @pessoa.idade = 46
      expect(@pessoa).to have_attributes(nome: "André", idade: 46)
      puts ">>> ANTES <<<"
      puts "Nome:#{@pessoa.nome} - Idade:#{@pessoa.idade}"
    end

    it 'have_attributes' do
      @pessoa.nome = "Sem_nome"
      @pessoa.idade = "Sem_idade"
      expect(@pessoa).to have_attributes(nome: "Sem_nome", idade: "Sem_idade")
      puts ">>> DEPOIS <<<"
      puts "Nome:#{@pessoa.nome} - Idade:#{@pessoa.idade}"
    end
end

# before(:context) do
  #   puts ">>> Antes do Context... <<<"
  # end

  # after(:all) do
  #   puts ">>>...Depois de All tests <<<"
  # end
  
  # before(:each) do
  #   puts ">>> Antes de CADA teste... <<<"
  #   @pessoa = Pessoa.new
  #   @pessoa.nome = "André"
  #   @pessoa.idade = 46
  #   puts " >>> #{@pessoa.inspect} <<<"
  # end

  # after(:each) do
  #   puts ">>>...Depois de CADA teste... <<<"
  #   @pessoa.nome = "Sem nome"
  #   @pessoa.idade = "Sem idade"
  #   puts " >>> #{@pessoa.inspect} <<<"
  # end
