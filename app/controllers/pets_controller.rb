class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  def index
    @pets = Pet.all
  end

  def show
    # uses :set_pet
    authorize @pet
    @review = Review.new
    skip_authorization
  end

  def new
    @pet = Pet.new
    skip_authorization
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
    skip_authorization
  end

  def edit
    # uses :set_pet
  end

  def update
    # uses :set_pet
    @pet.update(pet_params)
    redirect_to pet_path(@pet)
  end

  def destroy
    # uses :set_pet
    @pet.destroy
    redirect_to pets_path
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :availability, :breed, :description, :user_id, :photo)
  end
end
