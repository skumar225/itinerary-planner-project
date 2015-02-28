class ReviewsController < ApplicationController
before_action :signed_in
before_action :find_reviewable


  def create
    @review = @reviewable.reviews.build(review_params)
    if @review.save
      flash[:notice] = "Your review has been added"
      redirect_to :back
    else
      flash[:notice] = "Please add text. Blank reviews are not allowed"
      redirect_to @reviewable
    end
  end

  def destroy
    review = Review.find(params[:id])
    if session[:user_id] == review.reviewable_id #do we want the creator to be able to delete other people's reviews?
    review.destroy
    flash[:notice] = "Review deleted"
    redirect_to :back
    else
      flash[:notice] = "This review belongs to another companion"
      redirect_to :back
    end
  end

  def index
  end

private
# checking if user signed in before allowing them to add a review
  def signed_in
    unless session[user_id]
      flash[:notice] = "You must be logged in to add a comment"
    end
  end

  def find_reviewable
    params.each do |name, value|
    if name =~ /(.+)_id$/
      @reviewable = $1.classify.constantize.find(value)
      return @reviewable
    end
  end
    nil
  end

  def review_params
    params.require(:review).permit(:review_text)
  end
end
