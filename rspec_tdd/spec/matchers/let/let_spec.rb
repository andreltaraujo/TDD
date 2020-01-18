$counter = 0 # $ Significa uma variável global. Qualquer instância da classe pode acessar.

describe 'let' do
  let(:count) { $counter += 1 } # <= é invocada apenas uma vez. 

  it 'memoriza o valor' do
    expect(count).to eq(1) # 1ª envocação => é carregada  
    expect(count).to eq(1) # 2ª envocação => está em cache
  end

  it 'entre os testes não é feito o cache' do
    expect(count).to eq(2) # é carregada novamente
  end
end