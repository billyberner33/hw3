class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def show
    @place = Place.find_by(id: params[:id])
    @entries = Entry.where(place_id: @place.id)
  end

  def new
    @place = Place.new  # Initialize a new place
  end

  def create
    @place = Place.new(name: params[:name])  # Ensure name is assigned correctly
  
    if @place.save
      redirect_to "/places", notice: "Place added successfully!"
    else
      flash[:alert] = "Error: Place name cannot be blank."
      render :new
    end
  end
  
  
end
