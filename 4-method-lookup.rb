module MiddleMan
  def say_hello
    p "Hello from module MiddleMan"
  end
end

class Base
  def say_hello
    p "Hello from class Base"
  end
end

class Test1 < Base
end

class Test2 < Base
  include MiddleMan
end

class Test3 < Base
  def say_hello
    p "Hello from class Test3"
  end
  include MiddleMan
end

[Test1, Test2, Test3].each do |klass|
  klass.new.say_hello
end

singleton = Test3.new
def singleton.say_hello
  p "Hello from singleton of class Test3"
end

singleton.say_hello

def singleton.method_missing(name, *args, &block)
  if name == :whoami
    "a rubyist & solist"
  else
    super
  end
end

p singleton.whoami
p singleton.bang! #undefined method `bang!', from Kernel