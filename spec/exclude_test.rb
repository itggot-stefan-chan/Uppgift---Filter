require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require 'mocha/mini_test'

require_relative '../lib/filters'

Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]


describe 'exclude' do

  it 'should take a list and an filter as argument' do
    proc { exclude() }.must_raise ArgumentError
    proc { exclude(['Im not using keyword arguments'],'bosse') }.must_raise ArgumentError
  end

  it 'should return an array' do
    exclude(array: [1,2,3], value: 3).must_be_instance_of Array
  end

  it 'should not modify the original array' do
    input = [1,2,3,3,4]
    exclude(array: input, value: 3)
    input.must_equal [1,2,3,3,4]
  end

  it 'should should remove all occurrences of "value" from the returned array' do
    exclude(array: ['bosse', 'daniel', 'edvard', 'bosse', 'bosse'], value: 'bosse' ).must_equal ['daniel', 'edvard']
    exclude(array: ['bosse', 'daniel', 'edvard', 'bosse', 'bosse'], value: 'edvard').must_equal ['bosse', 'daniel', 'bosse', 'bosse']
  end

end
