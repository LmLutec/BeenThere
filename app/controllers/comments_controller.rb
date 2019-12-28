class CommentsController < ApplicationController

    def new
        @comment = Comment.new(review_id: params[:review_id], user_id: session[:user_id])
    end 

    def create
        @comment = Comment.create(comment_params)
        byebug
        @user = User.find_by(id: session[:user_id])

    end 





    private

    def comment_params
        params.require(:comment).permit(:user_id, :review_id, :content)
    end 
end
