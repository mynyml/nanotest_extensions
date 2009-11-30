# "Simplicity is the ultimate sophistication" --Leonardo Da Vinci

module Nanotest
  class << self
    alias :stats__orig_results :results

    def results
      stats = "\n(%f seconds) %d assertions, %d failures" % [Time.now-$nanotest_time, @@dots.size, @@failures.size]

      # insert stats after failure message if any, or dots otherwise
      lines, pos = stats__orig_results.split(/\n/), nil
      lines.each_with_index {|line, i| pos = i if line =~ /\((.*):\d+\).*$/ || line =~ /(\.|F)+/ }
      lines.insert(pos + 1, stats).join("\n")
    end
  end
end

BEGIN { $nanotest_time = Time.now }
