require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require 'mocha/mini_test'

require_relative '../lib/filters'

Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]

describe 'unique' do

  it 'should take an array as argument' do
    proc{ unique() }.must_raise ArgumentError
    proc{ unique(['Im not using keyword arguments']) }.must_raise ArgumentError
  end

  it 'should return an array' do
    unique(array: [1,2,3]).must_be_instance_of Array
  end

  it 'should not modify the original array' do
    input = [1,2,3,3,4]
    unique(array: input)
    input.must_equal [1,2,3,3,4]
  end

  it 'should return a new array with all duplicates removed' do
    unique(array: ['bosse', 'daniel', 'edvard', 'bosse', 'bosse']).must_equal ['bosse', 'daniel', 'edvard']
  end

end
