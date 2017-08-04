
# Check that plink executable is in the path
describe command('plink --version | xargs echo -n') do
  its('exit_status') { should eq 0 }
  its('stdout') { should match('PLINK v1.90b4.5 64-bit (25 Jul 2017)') }
end

describe os_env('PLINK_VERSION') do
  its('content') { should eq 'v1.90b4.5' }
end

# Check that plink works -  comes with a test data set!
describe command('plink --file /usr/local/lib/plink/toy --out /tmp/plink_test --make-bed') do
  its('exit_status') { should eq 0 }
  its('stdout') { should match('... done') }
  its('stderr') { should eq '' }
end

describe command('plink --bfile /tmp/plink_test --out /tmp/plink_test --missing --freq --assoc --adjust') do
  its('exit_status') { should eq 0 }
  its('stdout') { should match('... done') }
  its('stderr') { should eq '' }
end
