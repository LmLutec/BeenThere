require 'pry'
module LocationsHelper
    
    


    def by_location(location)
        "#{location.country}," + " #{location.state}," + " #{location.city}"
    end 

    def find_by_country(location)
        break_down_location = location.split(", ")
        search = Location.find_by(country: break_down_location[0], state: break_down_location[1], city: break_down_location[2])
        search 
    end 

    def location_match(location)
        @locations = Location.all
        @locations.each do |place|
    
        if location == place 
            @add = place 
        else 
            false
        end 
            end 
        @add 
   end 


   def capitalize_location(location)
    breakdwn_location = location.split(" ")

        if breakdwn_location.length == 2
            breakdwn_location[0] = breakdwn_location[0].capitalize 
            breakdwn_location[1] = breakdwn_location[1].capitalize
            location = breakdwn_location.join(" ")
            return location
        else 
            location = breakdwn_location.join(" ")
            return location.capitalize 
        end 

   end 

end
