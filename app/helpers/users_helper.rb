module UsersHelper


   def logged_in?
      if session[:user_id]
         true
      else 
         false
      end 
   end 



   def current_user
    if logged_in? 
      current_user = session[:user_id]
    end 
    current_user
   end 


   def incoming_comments 
      user_received = []
      comments = User.find_by(id: current_user).comments_received
      comments.each do |comment|
         user_received << comment.content
         @user = comment.user.first_name
         @comment = comment 
         @location = by_location(comment.review.location)

      end 
      user_received
      
   end 
end


