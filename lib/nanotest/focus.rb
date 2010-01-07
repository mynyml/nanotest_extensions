# "Things should be made as simple as possible, but no simpler."
# --Albert Einstein

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

  def assert(msg=nil,file=nil,line=nil,stack=caller,&block)
    if @@focused
      if @@focus_next
        @@focus_next = false
        focus__orig_assert(msg,file,line,stack,&block)
      end
    else
      focus__orig_assert(msg,file,line,stack,&block)
    end
  end
end
