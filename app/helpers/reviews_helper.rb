module ReviewsHelper


    def avg_satisfied(reviews)
        @reviews = Location.find_by(id: params[:id]).reviews 
        a = @reviews.average(:satisfaction) / 4 * 100
        number_to_percentage(a, strip_insignificant_zeros:true)     
    end 

    def avg_revisit(location)
        @reviews = location.reviews 
        a = @reviews.average(:revisit) / 2 * 100 
        number_to_percentage(a, strip_insignificant_zeros:true)
    end 

    def avg_suggest(location)
        @yes = []
        no = []
        @reviews = location.reviews 
        @reviews.each do |review|
            if review.suggest == "Yes"
                @yes << review.suggest 
            else
                no << review.suggest 
            end 
        end   
     count = @reviews.count
     f = count / @yes.count
    end
    
end
