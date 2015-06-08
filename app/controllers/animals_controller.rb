class AnimalsController < ApplicationController

def index
  @animals = Animal.all
  @sighting = Sighting.all
  render('animals/index.html.erb')
end

def create
  @animal = Animal.new(animal_params)
  if @animal.save
    render('animals/success.html.erb')
  else
    render('animals/new.html.erb')
  end
end

def new
  @animal = Animal.new
  render('animals/new.html.erb')
end

def show
  @animal = Animal.find(params[:id])
  @sightings = @animal.sightings.all
  render('animals/show.html.erb')
end

def edit
  @animal = Animal.find(params[:id])
  render('animals/edit.html.erb')
end

def update
  @animal = Animal.find(params[:id])
  if @animal.update(animal_params)
    render('animals/success.html.erb')
  else
    render('animals/edit.html.erb')
  end
end

def destroy
  @animal = Animal.find(params[:id])
  @animal.destroy
  render('animals/destroy.html.erb')
end

private

def animal_params
  params.require(:animal).permit(:species, :image_url, :population)
end

end
