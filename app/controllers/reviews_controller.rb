class ReviewsController < ApplicationController
  def new
  end

  def create
    @review = Review.new(review_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review.cocktail = @cocktail
    if @review.save
      @cocktail.rating = give_rating
      @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def give_rating
    rating = 0
    @cocktail.reviews.each do |review|
      rating += review.rating
    end
    rating = rating / @cocktail.reviews.count
  end
  
  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
