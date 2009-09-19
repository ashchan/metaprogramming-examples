class MyClass
  def walk
    p 'walk'
  end
end

AnotherClass = Class.new do             # just as MyClass.new
  def run
    p 'run'
  end

  define_method :talk do                # dynamic method
    p 'i am a big mouth'
  end
end

# MyClass.new.walk
# AnotherClass.new.talk

Class.methods.grep /new/                # new is aclass method, not a keyword

obj = AnotherClass.new
p obj.class
p AnotherClass.class
