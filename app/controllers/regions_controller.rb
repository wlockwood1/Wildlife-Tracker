class RegionsController < ApplicationController

  def index
    @regions = Region.all
    @sightings = Sighting.all
    render('regions/index.html.erb')
  end

  def create
    @region = Region.new(region_params)
    if @region.save
      render('regions/success.html.erb')
    else
      render('regions/new.html.erb')
    end
  end

  def new
    @region = Region.new
    render('regions/new.html.erb')
  end

  def show
    @region = Region.find(params[:id])
    @sightings = Sighting.all.where(:region_id => @region.id)
    render('regions/show.html.erb')
  end

  def edit
    @region = Region.find(params[:id])
    render('regions/edit.html.erb')
  end

  def update
    @region = Region.find(params[:id])
    if @region.update(params[:region])
      render('regions/success.html.erb')
    else
      render('regions/edit.html.erb')
    end
  end

  def destroy
    @region = Region.find(params[:id])
    @region.destroy
    render('regions/destroy.html.erb')
  end

private

  def region_params
    params.require(:region).permit(:region_name)
  end

end
