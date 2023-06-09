class ReviewsController < ApplicationController
  before_action :set_booking, only: [:new, :create]

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
    @pet = @review.pet
    authorize @review
  end

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.booking = @booking
    authorize @review
    if @review.save
      redirect_to pet_path(@booking.pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end
end
