class SightingsController < ApplicationController

  def create
    @sighting = Sighting.new(sighting_params)
    if @sighting.save
      redirect_to("/animals/#{@sighting.animal_id}")
    else
      render('sightings/new.html.erb')
    end
  end

  def new
    animal = Animal.find(params[:animal_id])
    @sighting = animal.sightings.new
    @regions = Region.all
    render('sightings/new.html.erb')
  end

  def edit
    @sighting = Sighting.find(params[:id])
    @regions = Region.all
    render('sightings/edit.html.erb')
  end

  def show
  @sightings = Sighting.all.where(date: params[:start_date]..params[:end_date]).order("date DESC")
  render('sightings/show.html.erb')
  end

  def update
    @sighting = Sighting.find(params[:id])
    @regions = Region.all
    if @sighting.update(params[:sighting])
      redirect_to("/animals/#{@sighting.animal_id}")
    else
      render('sightings/edit.html.erb')
    end
  end

  def destroy
    @sighting = Sighting.find(params[:id])
    @sighting.destroy
    redirect_to("/animals/#{@sighting.animal_id}")
  end

private

  def sighting_params
    params.require(:sighting).permit(:animal_id, :date, :latitude, :longitude, :region, :region_id)
  end

end
