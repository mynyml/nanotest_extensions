require 'test/test_helper'
require 'nanotest/focus'
include  Nanotest

# test: retroactively supress assertions when focus is called
assert("should not be run") { false }

# test: only run focused assertions
focus
assert { true }
assert("should not be run") { false }

# test: focuses multiple assertions
focus
assert { true }
assert("should not be run") { false }

# ensure focused assertions were run
focus
assert { Nanotest.send(:class_variable_get, :@@dots).size == 2 }
