class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
    @pet = @booking.pet
    @owner = @pet.user
    @user = @booking.user
    @review = Review.new


    unless @booking.review.nil?
      @existing_review = @booking.review
    end

    authorize @booking
  end

  def new
    @booking = Booking.new
    @pet = Pet.find(params[:pet_id])
    skip_authorization
  end

  def create
    @booking = Booking.new(booking_params)
    @pet = Pet.find(params[:pet_id])
    @booking.pet = @pet
    @booking.user = current_user
    @booking.status = "pending"
    if @booking.save
      redirect_to dashboard_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
    skip_authorization
  end

  def edit
    skip_authorization
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
    skip_authorization
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :pet_id, :start_date, :end_date, :booking_date, :status, :user_id, :photo, :description)
  end
end
