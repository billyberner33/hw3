class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def show
    @place = Place.find_by(id: params[:id])
    @entries = Entry.where(place_id: @place.id)
  end

  def new
    @place = Place.new  # Initialize a new place object
  end

  def create
    @place = Place.new(name: params[:name])  # Only assign name

    if @place.save
      redirect_to "/places", notice: "Place added successfully!"
    else
      flash[:alert] = "Error: Place could not be saved."
      render :new  # Stay on the new form if there's an error
    end
  end
end
