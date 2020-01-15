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


end
