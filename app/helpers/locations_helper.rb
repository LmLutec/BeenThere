module LocationsHelper
    

    def by_location(location)
        "#{location.country}," + " #{location.state}," + " #{location.city}"
    end 

end
