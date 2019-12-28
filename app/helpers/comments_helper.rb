module CommentsHelper

    def comment_count(review)
        review.comments.count 
    end 

end
