$count = 0

describe 'let!' do
  ordem_de_invocação = []

  let!(:contador) do
    ordem_de_invocação << :let!
    $count += 1
  end

  it 'chama o método helper antes do teste' do
    ordem_de_invocação << :exemplo 
    expect(ordem_de_invocação).to eq([:let!, :exemplo])  
    expect(contador).to eq(1)
  end
end