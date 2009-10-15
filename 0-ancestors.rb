#!/usr/bin/env ruby

class C
end

p C.ancestors                     # => [C, Object, Kernel, BasicObject]
                                  # => [C, Object, Kernel] in Ruby 1.8

p Class.ancestors                 # =>  [Class, Module, Object, Kernel, BasicObject]
                                  # =>  [Class, Module, Object, Kernel] in Ruby 1.8
