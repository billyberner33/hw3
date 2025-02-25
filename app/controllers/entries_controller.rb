class EntriesController < ApplicationController
  def new
    def new
      @place = Place.find_by(id: params["place_id"])
  end

  def create
    @entry = Entry.new

    # Assign user input to entry fields
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["posted_on"] = params["posted_on"]
    
    # Assign relationship between Entry and Place
    @entry["place_id"] = params["place_id"]

    # Save the entry to the database
    @entry.save

    # Redirect back to the place's show page
    redirect_to "/places/#{@entry["place_id"]}"
  end
end
