module Nanotest::Contexts
  extend self

  Context = Struct.new(:setup, :teardown)

  def context(&block)
    @_contexts ||= []
    @_contexts << Context.new
    instance_eval(&block)
    @_contexts.pop
  end

  def setup(&block)
    @_contexts.last.setup = block
  end

  def teardown(&block)
    @_contexts.last.teardown = block
  end

  def test(&block)
    @_contexts.map {|c| c.setup }.compact.each {|s| s.call }
    block.call
    @_contexts.map {|c| c.teardown }.compact.each {|s| s.call }
  end
end
