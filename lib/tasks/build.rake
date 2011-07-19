desc 'Run all tests'
task :build do
  system "rspec spec"
  system "cucumber"
end
