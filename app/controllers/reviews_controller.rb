class ReviewsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @review = Review.new(review_params)
    @review.list = @list

    if @review.save
      redirect_to list_path(@list)
    else
      redirect_to list_path(@list), alert: @review.errors.full_messages.to_sentence
    end
  end

  def destroy
    @review = Review.find(params[:id])
    list = @review.list
    @review.destroy

    redirect_to list_path(list)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
