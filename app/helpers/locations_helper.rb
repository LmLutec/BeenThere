module LocationsHelper
    
    


    def by_location(location)
        "#{location.country}," + " #{location.state}," + " #{location.city}"
    end 

  
    def location_match(location)
        locations = Location.all
        locations.each do |place|
        if location == place 
            puts "true"
        else 
            puts "false"

        end 
            end 
   end 
end
