require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require 'mocha/mini_test'

require_relative '../lib/filters'

Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]

describe 'filter' do

  it 'should take a list and a value as argument' do
      proc{ filter() }.must_raise ArgumentError
      proc{ filter(["Im not using keyword arguments"],"bosse") }.must_raise ArgumentError
  end

  it 'should return an array' do
    filter(array: [1,2,3], value: 3).must_be_instance_of Array
  end

  it 'should not modify the original array' do
    input = [1,2,3,3,4]
    filter(array: input, value: 3)
    input.must_equal [1,2,3,3,4]
  end

  it 'should should return an array only containing all occurences of "value" ' do
    filter(array: ['bosse', 'daniel', 'edvard', 'bosse', 'bosse'], value: 'bosse').must_equal ['bosse', 'bosse', 'bosse']
    filter(array: ['bosse', 'daniel', 'edvard', 'bosse', 'bosse'], value: 'edvard').must_equal ['edvard']
  end


end
