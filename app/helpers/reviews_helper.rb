module ReviewsHelper


    def avg_satisfied(location)
        @reviews = location.reviews 
        a = @reviews.average(:satisfaction) / 4 * 100
        number_to_percentage(a, strip_insignificant_zeros:true)     
    end 

    def avg_revisit(location)
        @reviews = location.reviews 
        a = @reviews.average(:revisit) / 2 * 100 
        number_to_percentage(a, strip_insignificant_zeros:true)
    end 

    def num_to_text(review)
        if review.revisit == "2" 
            new_rev = "Absolutely" 
        elsif review.revisit == "1"
            new_rev = "Maybe"
        else
            new_rev = "No"
        end 
        new_rev
    end 

    def food_rating(location)
        @reviews = location.reviews 
        a = @reviews.average(:food_rating) / 10 * 100 
        number_to_percentage(a, strip_insignificant_zeros:true)
    end

end



                