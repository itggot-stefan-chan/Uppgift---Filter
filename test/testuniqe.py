#encoding: utf-8

from nose.tools import *
import sys
sys.path.append('../lib')

from filters import unique

@raises(TypeError)
def test_takes_a_list_and_object_as_argument():
    unique(1337)
    unique()


def test_should_return_list():
    result = unique([1, 2, 3])

    # result should  be a list
    assert_true(isinstance(result, list))


def test_should_return_list_with_unique_items():
    pass
    result = unique(["bosse", "daniel", "edvard", "bosse", "bosse"])

    length = len(result) # should be 3


    #sort the result, is not stable
    result.sort()

    testres = sorted(list(set(result)))

    assert_equal(result, testres)
    assert_equal(length, 3)