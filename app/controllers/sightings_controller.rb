class SightingsController < ApplicationController
  def show
    sighting = Sighting.find_by(params[:id])
    if sighting
      render json: sighting.to_json(:include => {
        :bird => {:only => [:name, :species]},
        :location => {:only => [:latitude, :longitude]}
      }, :except => [:updated_at])
    else 
      redner json: { message: 'No sighting found with that id'}
    end
  end
end
