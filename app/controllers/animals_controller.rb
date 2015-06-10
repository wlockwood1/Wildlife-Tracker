class AnimalsController < ApplicationController

def index
  @animals = Animal.all
  @sighting = Sighting.all
  render 'index'
end

def create
  @animal = Animal.new(animal_params)
  if @animal.save
    flash[:notice] = "Animal added."
    redirect_to '/'
  else
    render 'new'
  end
end

def new
  @animal = Animal.new
  render 'new'
end

def show
  @animal = Animal.find(params[:id])
  @sightings = @animal.sightings.all
  render 'show'
end

def edit
  @animal = Animal.find(params[:id])
  render 'edit'
end

def update
  @animal = Animal.find(params[:id])
  if @animal.update(animal_params)
    flash[:notice] = "Animal updated."
    redirect_to '/'
  else
    render 'edit'
  end
end

def destroy
  @animal = Animal.find(params[:id])
  @animal.destroy
  flash[:notice] = "Animal deleted."
  redirect_to '/'
end

private

def animal_params
  params.require(:animal).permit(:species, :image_url, :population)
end

end
