class EntriesController < ApplicationController
  def new
    @place = Place.find_by(id: params["place_id"])

    if @place.nil?
      redirect_to "/places", alert: "Error: Place not found. Please select a valid place."
    else
      @entry = Entry.new  # Initialize a new entry object
    end
  end

  def create
    @entry = Entry.new

    # Assign user input to entry fields
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["posted_on"] = params["posted_on"]
    @entry["place_id"] = params["place_id"]

    if @entry.save
      redirect_to "/places/#{@entry["place_id"]}", notice: "Entry added successfully!"
    else
      render :new, alert: "Error: Entry could not be saved."
    end
  end
end
