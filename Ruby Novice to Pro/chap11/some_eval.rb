class Class
  def add_accessor(accessor_name)
    self.class_eval %Q{
      attr_accessor :#{accessor_name}
    }
  end
end

class Person
end

# First example
# def add_accessor_to_person(accessor_name)
#   Person.class_eval %Q{
#     attr_accessor :#{accessor_name}
#   }
# end


person = Person.new
Person.add_accessor :name
Person.add_accessor :gender
person.name = "Draco Li"
person.gender = :male
puts "#{person.name} is #{person.gender}"