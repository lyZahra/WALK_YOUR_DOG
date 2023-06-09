class PagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!, only: :home

  def home
    @pets = Pet.all

  end
end
