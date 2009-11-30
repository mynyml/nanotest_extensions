# "Perfection is achieved, not when there is nothing more to add, but when
# there is nothing left to take away." --Antoine de Saint Exupéry

class Nanotest::Spec
  instance_methods.each {|m| undef_method(m) unless m.match(/^__|object_id/) }

  def initialize(obj, positive=true)
    @obj, @positive = obj, positive
  end

  def method_missing(method, *args, &block)
    file, line = caller.first.split(':')[0..1]
    bool = @obj.__send__(method, *args, &block)
    bool = !bool unless @positive
    Nanotest.assert(nil, file, line) { bool }
    @obj
  end
end

class Object
  def must
    Nanotest::Spec.new(self)
  end
  def wont
    Nanotest::Spec.new(self, false)
  end
end
