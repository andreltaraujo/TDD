describe 'Ruby on Rails' do
  it { is_expected.to start_with("Ruby").and end_with("Rails") }
  it { expect(fruta).to eq('banana').or eq('laranja').or eq('uva') }

  #def fruta # arbitrary helper method 
  #  %w(banana laranja uva).sample
  #end
end