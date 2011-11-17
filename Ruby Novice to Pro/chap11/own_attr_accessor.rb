class Class
  def add_accessor(accessor_name)
    self.class_eval %Q{
      def #{accessor_name}
        @#{accessor_name}
      end
      
      def #{accessor_name}=(value)
        @#{accessor_name} = value
      end
    }
  end
end

class Person
  add_accessor :name;
  add_accessor :gender;
end

draco = Person.new
draco.name = 'Draco'
draco.gender = 'male'
puts "#{draco.name} is #{draco.gender}"