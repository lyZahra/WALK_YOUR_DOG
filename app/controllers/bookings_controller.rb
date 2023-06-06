class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
    @pet = @booking.pet
    @owner = @pet.user
    @user = @booking.user
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
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
    skip_authorization
  end

  def edit
    authorize @booking
  end

  def update
    authorize @booking
    if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :pet_id, :start_date, :end_date, :status, :user_id, :photo, :description)
  end
end
