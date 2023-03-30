module InstanceCounter

   def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

module ClassMethods
  attr_reader :instances

  def set_instances
    @instances = 0
  end
  
  def instances_add
   return  @instances +=1
  end
   
  def set_register_instances
   @instance_count = 0
  end
end

module InstanceMethods

  protected

  def register_instance_set
    count=self.class.instance_variable_get :@instance_count
    return self.class.instance_variable_set :@instance_count, count+1
  end
end
end