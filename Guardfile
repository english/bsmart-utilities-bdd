# A sample Guardfile
# More info at https://github.com/guard/guard#readme

#guard 'cucumber', :cli => "--color --format progress" do
  #watch(%r{^features/.+\.feature$})
  #watch(%r{^features/support/.+$})          { 'features' }
  #watch(%r{^features/step_definitions/(.+)_steps\.rb$}) { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' }
#end

guard 'rspec', :version => 2 do
  watch(%r{^spec/bsmart/ecom/.+_spec\.rb})
  watch(%r{^lib/bsmart/ecom/(.+)\.rb$})       { |m| "spec/ecom/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end
