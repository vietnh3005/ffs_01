class Supports::Relationship

  %w(products categories).each do |method|
    define_method method do
      instance_variable_set "@#{method}",
        method.classify.constantize.all.collect {|object| [object.name, object.id]}
    end
  end
end
