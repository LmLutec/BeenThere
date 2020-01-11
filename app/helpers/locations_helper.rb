module LocationsHelper
    
    


    def by_location(location)
        "#{location.country}," + " #{location.state}," + " #{location.city}"
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
