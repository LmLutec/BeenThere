models  

User
has_many reviews # @user.reviews
has_many locations through reviews # @user.locations && @user.reviews.first.location

## Stretch Goals
has_many comments # @user.comments
has_many reviews through comments # @user.reviews.first.comments

Review
belongs_to user
belongs_to location

## Stretch Goal
has_many comments
has_many users through comments



Location
has_many reviews
has_many users through reviews 

## Stretch Goal
Comment
belongs_to user
belongs_to review