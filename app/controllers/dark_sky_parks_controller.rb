class DarkSkyParksController < ApplicationController
    def index
        @dark_sky_parks = DarkSkyPark.all
        render json: @dark_sky_parks.as_json(include: {likes:{}, comments:{}})
    end

    def show
        @dark_sky_parks = DarkSkyPark.find(params[:id])
        render json: @dark_sky_parks.to_json(include: {likes: {}, comments:{}})
    end

end
