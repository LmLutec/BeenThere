module LocationsHelper
    
    


    def by_location(location)
        "#{location.country}," + " #{location.state}," + " #{location.city}"
    end 

  
    def add_by_location(locations)
        @locations_array = []
    
        locations.each do |location|
            @locations_array << by_location(location) 
        end 
        @locations_array = @locations_array.uniq
    end 


    def location_match(location)
        @locations = Location.all
        @locations.each do |place|
        if location == by_location(place) 
            puts "true"
        else 
            puts "false"

        end 
            end 
   end 
end
