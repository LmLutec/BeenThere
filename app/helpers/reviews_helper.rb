module ReviewsHelper


    def avg_satisfied(reviews)
        @reviews = Location.find_by(id: params[:id]).reviews 
        @reviews.average(:satisfaction).round 
    end 

    def avg_revisit(location)
        @reviews = location.reviews 
        @reviews.average(:revisit).round 
    end 

end
