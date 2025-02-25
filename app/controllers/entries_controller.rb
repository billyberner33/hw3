class EntriesController < ApplicationController
  def new
    @place = Place.find_by(id: params[:place_id])

    if @place.nil?
      redirect_to "/places", alert: "Error: Place not found. Please select a valid place."
    else
      @entry = Entry.new
    end
  end

  def create
    @entry = Entry.new(
      title: params[:title],
      description: params[:description],
      posted_on: params[:posted_on],
      place_id: params[:place_id]
    )
  
    if @entry.save
      redirect_to "/places/#{@entry.place_id}", notice: "Entry added successfully!"
    else
      flash[:alert] = "Error: Entry could not be saved. " + @entry.errors.full_messages.join(", ")
      render :new
    end
  end
end
