class CommentsController < ApplicationController
    include LocationsHelper

    def new
        @comment = Comment.new(review_id: params[:review_id], user_id: session[:user_id])
    end 

    def create
        @comment = Comment.create(comment_params)
        @review = Review.find_by(id: @comment.review_id)
        @location = @review.location
        redirect_to location_review_comments_path(@location, @review)
    end 

    def index
        @comments = Review.find_by(id: params[:review_id]).comments
        @location = Review.find_by(id: params[:review_id]).location
        @user = Review.find_by(id: params[:review_id]).user
    end 



    private

    def comment_params
        params.require(:comment).permit(:user_id, :review_id, :content)
    end 
end
