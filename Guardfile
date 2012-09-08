# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'rspec', :version => 2, all_after_pass: false do
  watch('spec/lib/hello_spec.rb')
  watch('lib/hello.rb') { |m| "spec/lib/hello_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end

