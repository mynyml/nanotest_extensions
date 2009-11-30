require 'test/test_helper'
require 'nanotest/stats'
include  Nanotest

3.times { assert{ true  } }
2.times { assert{ false } }

# capture results/stats for above assertion fixtures
results        = Nanotest.results.strip
num_assertions = Nanotest.send(:class_variable_get, :@@dots    ).size
num_failures   = Nanotest.send(:class_variable_get, :@@failures).size

# reset results so we can begin actual tests
Nanotest.module_eval { @@dots.clear; @@failures.clear }

## functionality

expected = Regexp.new '
\.\.\.FF
.* assertion failed
.* assertion failed

\((\d|\.)+ \w+\) %d assertions, %d failures
'.strip % [num_assertions, num_failures]

# test results string contains stats
assert("expected #{expected.inspect} to match #{results.inspect}") {
  results.match(expected)
}
