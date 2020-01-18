RSpec::Matchers.define_negated_matcher :exclude, :include

describe Array.new([1,2,3]), "Array", collection: true do
  it '#include' do
  expect(subject).to include(2)
  expect(subject).to include(2,1) # Pode ser fora de ordem
end

  context '#exclude' do 
   it { expect(subject).to exclude(0,4) } 
  end


  it '#contain_exactly' do
  expect(subject).to contain_exactly(1,2,3)
  expect(subject).to contain_exactly(2,1,3) # Pode ser fora de ordem
  end

  it '#match_array' do
  expect(subject).to match_array([1,2,3])
  expect(subject).to match_array([3,1,2]) # Pode ser fora de ordem
  end
end