RSpec::Matchers.define :be_a_multiple_of do |params| # =>Recebendo aqui o 3 (params)
  match do |actual| # =>actual aqui é == o subject que aqui no caso é == o 18
    actual % params == 0
  end

  # Custom test output message
  failure_message do |actual|
    "expected that #{actual} would be a multiple of #{params}."
  end

  # Custom test description
  description do
    "this operation results be a multiple of #{params}."
  end
end

describe 18, 'Custom Matcher' do
  it { is_expected.to be_a_multiple_of(3)} # =>Aqui está passando o 3 (params)
end