class SightingsController < ApplicationController

  def create
    @sighting = Sighting.new(sighting_params)
    if @sighting.save
      render('sightings/success.html.erb')
    else
      render('sightings/new.html.erb')
    end
  end

  def new
    animal = Animal.find(params[:animal_id])
    @sighting = animal.sightings.new
    render('sightings/new.html.erb')
  end

  def edit
    @sighting = Sighting.find(params[:id])
    render('sightings/edit.html.erb')
  end

  def update
    @sighting = Sighting.find(params[:id])
    if @sighting.update(params[:sighting])
      render('sightings/success.html.erb')
    else
      render('sightings/edit.html.erb')
  end

private

  def sighting_params
    params.require(:sighting).permit(:animal_id, :date, :latitude, :longitude)
  end

end
