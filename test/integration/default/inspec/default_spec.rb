
# Check that Spades executable is in the path
describe command('/usr/lib/plink/plink --help') do
  its('exit_status') { should eq 0 }
  its('stdout') { should match('v1.07') }
end

# Check that spades works - spades comes with a test data set!
#describe command('spades.py --test') do
#  its('exit_status') { should eq 0 }
#  its('stdout') { should match('TEST PASSED CORRECTLY') }
#end
