class System

    @@bodies = []
    @@all_systems_mass = 0

    def self.bodies
        return @@bodies
    end

    def self.body_names
        output = []
        @@bodies.each do |i|
            output.push(i.name)
        end
        return output
    end

    def self.add(item)
        @@bodies.push(item)
        return @@bodies
    end

    def self.total_mass
        output = 0
        @@bodies.each do |body|
            output += body.mass
        end
        return output
    end
end

class Body

    def initialize(name, mass, star_system)
        @name = name
        @mass = mass
        @system = star_system
    end

    def name
        return @name
    end

    def mass
        return @mass
    end

    def star_system
        return @system
    end

    def add_to_system(item)
        System.add(item)
        return System.bodies
    end
end

class Planet < Body

    @@planets = []

    def self.all
        return @@planets
    end

    def initialize(name, mass, star_system, day, year)
        super(name, mass, star_system)
        @day = day
        @year = year
    end

    def self.create(name, mass, star_system, day, year)
        body = Planet.new(name, mass, star_system, day, year)
        if !System.body_names.include?(body.name)
            System.bodies.push(body)
            return body
        end
    end
end

class Star < Body

    @@stars = []

    def self.all
        return @@stars
    end

    def initialize(name, mass, star_system, type)
        super(name, mass, star_system)
        @type = type
    end

    def self.create(name, mass, star_system, type)
        body = Star.new(name, mass, star_system, type)
        if !System.body_names.include?(body.name)
            System.bodies.push(body)
            return body
        end
    end
end

class Moon < Body

    @@moons = []

    def self.all
        return @@moons
    end

    def initialize(name, mass, star_system, month, planet)
        super(name, mass, star_system)
        @month = month
        @planet = planet
    end

    def self.create(name, mass, star_system, month, planet)
        body = Moon.new(name, mass, star_system, month, planet)
        if !System.body_names.include?(body.name)
            System.bodies.push(body)
            return body
        end
    end
end

sun = Star.create("Sun", 100, "Solar System", "G-type")
earth = Planet.create("Earth", 50, "Solar System", 365, 30)
moon = Moon.create("Moon", 5, "Solar System", 15, earth)
sun = Star.create("Sun", 100, "Solar System", "G-type")

# puts "sun:"
# p sun
# puts "earth:"
# p earth
# puts "moon:"
# p moon

alpha_centauri = System.new
puts '-----'
puts System.bodies.length
puts '-----'
puts System.total_mass
