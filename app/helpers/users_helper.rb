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
      @user_received = []

      comments = User.find_by(id: current_user).comments_received
      comments.each do |comment|
         @user = comment.user.first_name
         @comment = comment 
         
         @user_received << @comment 

      end 
      @user_received
   
   end 
end


