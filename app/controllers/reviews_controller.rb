class ReviewsController < ApplicationController
  def big
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews.all
    @review = Review.new
    @review.widget = @restaurant.review_widget
    render :layout => false
  end

  def small
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews.all
    render :layout => false
  end
  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new(review_params)
    unless @review.user.present?
      @review.user = User.all.sample
    end
    unless @review.widget.present?
      @review.widget = @restaurant.review_widget
    end
    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:user_id, :text, :rating)
    end
end
