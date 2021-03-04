class Person
  attr_accessor :partner, :name

  def initialize(name)
    @name = name
  end

  def get_married(person)
    self.partner = person
    person.partner = self
  end
#added method below
  def get_married(person)
    self.partner = person
    if person.class != Person
        begin 
           raise PartnerError
        rescue PartnerError => error 
          puts error.message #defined method message in our error class
        end
    else
      person.partner = self #giving this instance a partner
    end
  end

  # Add the following two lines:
  class PartnerError < StandardError #could also define outside of our Person class -- or create a module and include that module inside the Person class
    def message
      "you must give the get_married method an argument of an instance of the person class!"
    end
  end

end

beyonce = Person.new("Beyonce")
beyonce.get_married("Jay-Z") #problem -- Jay-Z is a string --not an instance of the person class
puts beyonce.name






