describe 'Matcher output' do
  it { expect{puts "André!"}.to output.to_stdout }
  it { expect{print "André!"}.to output("André!").to_stdout }
  it { expect{puts "André!"}.to output(/André!/).to_stdout }

  it { expect{warn "André!"}.to output.to_stderr }
  it { expect{warn "André!"}.to output("André!\n").to_stderr }
  it { expect{warn "André!"}.to output(/André!/).to_stderr }
end