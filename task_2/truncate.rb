module Truncate
  @@method_name = "initialize"
  @@length = 120

  def truncate(method_name, length: 120)
    @@length = length
    @@method_name = method_name
  end

  def attr_accessor(*names)
    names.each do |name|
      define_method(name) {instance_variable_get("@#{name}")}
      define_method("#{name}=") do |arg|
        if name == @@method_name
          chars = arg.split("")
          if chars.length <= @@length
            arg = chars.join
          else
            arg = chars[0, @@length - 3].join + "..."
          end
        end
        instance_variable_set("@#{name}", arg)
      end
    end
  end
end
