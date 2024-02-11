class ObservationsController < ApplicationController

  def new
    @location = Location.find(params[:location_id])
    @observation = Observation.new
  end 

  def create
    @location = Location.find(params[:location_id])
    @observation = Observation.new(observation_params)
    @observation.location_id = params[:location_id]

    if @observation.save
      redirect_to location_path(params[:location_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @location = Location.find(params[:location_id])
    @observation = Observation.find(params[:id])
  end

  def update
    @observation = Observation.find(params[:id])
    if @observation.update(observation_params)
      redirect_to location_path(params[:location_id])
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    Observation.find(params[:id]).destroy
    redirect_to location_path(params[:location_id])
  end

  private
    def observation_params
      params.require(:observation).permit(:animalName, :description, :observationDate, :quantity)
    end
end
