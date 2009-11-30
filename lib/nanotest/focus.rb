module Nanotest

  @@focused = false

  def focus
    unless @@focused
      @@focused = true
      @@dots.clear
      @@failures.clear
    end
    @@focus_next = true
  end

  alias :focus__orig_assert :assert

  def assert(*args, &block)
    if @@focused
      if @@focus_next
        @@focus_next = false
        focus__orig_assert(*args, &block)
      end
    else
      focus__orig_assert(*args, &block)
    end
  end
end
