describe 'all', collection: true do # Tag Filters: assim também pode: =>:collection(symbol no lugar de collection: true)
  it {expect([1,7,9]).to all((be_odd).and be_an(Integer))}
  it {expect(['ruby', 'rails']).to all(be_a(String).and include('r'))}
end