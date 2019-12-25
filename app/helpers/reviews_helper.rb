module ReviewsHelper


    def avg_satisfied(reviews)
        @reviews = Location.find_by(id: params[:id]).reviews 
        a = @reviews.average(:satisfaction) / 4 * 100
        number_to_percentage(a, strip_insignificant_zeros:true)     
    end 

    def avg_revisit(location)
        @reviews = location.reviews 
        @reviews.average(:revisit).round 
    end 

end
