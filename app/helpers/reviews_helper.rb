module ReviewsHelper

    def satisfaction_ratings(location)
        @reviews = location.reviews 
        @reviews.collect do |review|
            
            if review.satisfaction == "The happiest I have ever been on Location(atleast that I can remember!)"
                review.satisfaction = "4"
            elsif review.satisfaction == "I enjoyed myself"
                review.satisfaction == "3"
            elsif review.satisfaction == "I know some things that could have used improvement"
                review.satisfaction == "2"
            elsif review.satisfaction == "Hey, it was a vacation"
                review.satisfaction == "1"
            elsif review.satisfaction == "eh, nothing to mention"
                review.satisfaction == "0"
            end 
            review.save 
            
        end
        avg_satisfied(@reviews)
    end 

    def avg_satisfied(reviews)
        @reviews = Location.find_by(id: params[:id]).reviews 
        @reviews.average(:satisfaction) 

    end 

end
