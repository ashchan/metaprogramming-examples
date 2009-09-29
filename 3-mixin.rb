module Feature
  def self.included(base)
    base.extend ClassMethods
    base.send(:include, InstanceMethods)
  end
  
  module ClassMethods
    def has_feature(name, opts = {})
      if_meth = opts.delete(:if)
      
      @features ||= {}
      @features[name] = if_meth || lambda { |k| true }
    end
    
    def features
      @features
    end
  end
  
  module InstanceMethods
    def has_feature?(feature)
      if if_meth = self.class.features[feature]
        if_meth.call(self)
      else
        false
      end
    end
  end
end

class Person
  include Feature
  alias has? has_feature?
  
  attr_accessor :age
  
  has_feature :name, :ignore => 'whatever', :so => 'so what'
  has_feature :sex, :if => lambda { |c| c.age > 16 }, :oops => 'ya'
end

kid = Person.new
kid.age = 12
p kid.has_feature?(:name)
p kid.has_feature?(:sex)

adult = Person.new
adult.age = 17
p adult.has?(:name)
p adult.has?(:sex)
