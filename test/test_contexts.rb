require 'nanotest'
require 'nanotest/contexts'

include Nanotest

# test: API
assert { Contexts.respond_to?(:context) }
assert { Contexts.respond_to?(:setup) }
assert { Contexts.respond_to?(:teardown) }
assert { Contexts.respond_to?(:test) }

class API
  include Contexts
end
assert { API.new.respond_to?(:context) }
assert { API.new.respond_to?(:setup) }
assert { API.new.respond_to?(:teardown) }
assert { API.new.respond_to?(:test) }


# the rest of the tests are self-hosted, for great justice
include Contexts

context do
  setup do
    @parent = 'parent'
  end
  test do
    # test: simple setup
    assert { @parent == 'parent' }
  end
  context do
    setup do
      @child = 'child'
    end
    teardown do
      @child =  nil; @sibling = 'sibling'
    end
    test do
      # test: parent setups are called
      assert { @parent == 'parent' }
      # test: descendent setups are also called
      assert { @child  == 'child'  }
    end
  end
  context do
    test do
      # test: teardown
      assert { @sibling == 'sibling' }
      # test: setups from sibling contexts are discarted
      # (setup from sibling context would set @child)
      assert { @child.nil? }
    end
  end
end

