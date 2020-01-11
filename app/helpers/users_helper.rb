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

end
