class EntriesController < ApplicationController
  before_action :set_place, only: [:new, :create]

  def new
    if @place.nil?
      redirect_to places_path, alert: "Error: Place not found. Please select a valid place."
    else
      @entry = @place.entries.build  
    end
  end

  def create
    if @place.nil?
      redirect_to places_path, alert: "Error: Place not found."
      return
    end

    @entry = @place.entries.build(entry_params)  
    
    if @entry.save
      redirect_to place_path(@place), notice: "Entry added successfully!"
    else
      render :new, status: :unprocessable_entity  
    end
  end

  private

  def set_place
    puts "Params received: #{params.inspect}"
    @place = Place.find_by(id: params[:place_id])  
    puts "Found Place: #{@place.inspect}" if @place
    puts "Place not found!" if @place.nil?
  end

  def entry_params
    params.require(:entry).permit(:title, :description, :posted_on) 
  end
end
