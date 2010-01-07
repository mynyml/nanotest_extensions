require 'nanotest'
begin
  require 'ruby-debug'
  require 'redgreen'#gem install mynyml-redgreen
rescue LoadError, RuntimeError
end

module Nanotest
  class << self
    def failures() @@failures end
    def dots() @@dots end
    def pop
      failures.pop
      dots.pop
    end
  end
end
