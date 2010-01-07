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
assert { Nanotest.dots.size == 2 }

# test: correctly references origin of assertion
focus; assert('') { false }; line = __LINE__

actual, expected = Nanotest.failures.last, "(%s:%0.3d) " % [__FILE__,line]
Nanotest.pop
focus
assert("expected: #{expected.inspect}, got: #{actual.inspect}") { actual == expected }

