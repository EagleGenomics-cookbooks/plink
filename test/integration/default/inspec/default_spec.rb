plink_version = 'PLINK v1.90b5 64-bit (14 Nov 2017)'

# Check that plink executable is in the path
describe command('plink --version | xargs echo -n') do
  its('exit_status') { should eq 0 }
  its('stdout') { should eq plink_version }
end

describe os_env('PLINK_VERSION') do
  its('content') { should eq plink_version }
end

# Check that plink works -  comes with a test data set!
describe command('plink --file /usr/local/lib/plink/toy --out /tmp/plink_test --make-bed') do
  its('exit_status') { should eq 0 }
  its('stdout') { should match('... done') }
end

describe command('plink --bfile /tmp/plink_test --out /tmp/plink_test --missing --freq --assoc --adjust') do
  its('exit_status') { should eq 0 }
  its('stdout') { should match('... done') }
end
