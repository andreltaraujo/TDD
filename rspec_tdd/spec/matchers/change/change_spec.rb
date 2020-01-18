require 'contador'

describe 'Matcher change' do
  it {expect{Contador.increment}.to change {Contador.qtde} } # => 1
  it {expect{Contador.increment}.to change {Contador.qtde}.by(1) } # => 2
  it {expect{Contador.increment}.to change {Contador.qtde}.from(2).to(3) } # => 3
end