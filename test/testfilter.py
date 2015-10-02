#encoding: utf-8

from nose.tools import *
import sys
sys.path.append('../lib')

from filters import filter

@raises(TypeError)
def test_takes_a_list_and_object_as_argument():
    filter(1337, 45)
    filter()
    filter("kjkj")
    filter([1, 2, 3])

def test_should_return_list():
    result = filter([1, 2, 3], 4)

    # result should  be a list
    assert_true(isinstance(result, list))


def test_should_return_list_with_only_bosse_items():
    result = filter(["bosse", "daniel", "edvard", "bosse", "bosse"], "bosse")

    length = len(result) # should be 3


    for name in result:
        assert_equal(name, "bosse")

    assert_equal(length,3)