class MyClass
  def initialize
    yield self if block_given?
  end
end


t = MyClass.new do |m|
  m.instance_eval {
    @i = 10
  }
  
  m.class.class_eval {
    define_method :i do
      @i
    end
  }
end

p t.i