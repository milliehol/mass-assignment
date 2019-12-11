class Person
 
  attr_accessor :name, :birthday, :hair_color, :eye_color, :height, 
:weight, :handed, :complexion, :t_shirt_size, 
:wrist_size, :glove_size, :pant_length, :pant_width
 
  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
  end
  
  def get_married(person)
    self.partner = person
    if person.class != Person
      begin
        raise PartnerError
      rescue PartnerError => error
          puts error.message
      end
    else
      person.partner = self
    end
  end
  
   class PartnerError < StandardError
    def message
      "you must give the get_married method an argument of an instance of the person class!"
    end
  end
end
 
beyonce = Person.new("Beyonce")
beyonce.get_married("Jay-Z")
puts beyonce.name

end