class ReviewsController < ApplicationController
  before_action :check_for_logged_in, only: [:new, :create, :edit, :update]

  def index
    @vet = Vet.find_by_id(params[:vet_id])
    if @vet
      @reviews = @vet.reviews
    else
      redirect_to vets_path
    end
  end

  def new
    @vet = Vet.find_by_id(params[:vet_id])
    #@review = Review.new(vet: @vet)
    @review = @vet.reviews.build
  end


  #unnested
  def create
    @vet = Vet.find_by_id(params[:vet_id])
    @review = current_user.reviews.build(review_params)
    @review.vet = @vet
    if @review.save
      redirect_to vet_path(@review.vet)
    else

      render :new
    end
  end

  private
    def review_params
      params.require(:review).permit(:content, :rating)
    end
end
