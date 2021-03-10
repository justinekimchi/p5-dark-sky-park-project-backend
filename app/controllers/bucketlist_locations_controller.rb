class BucketlistLocationsController < ApplicationController
    def index
        @bucketlist_locations = BucketlistLocation.all
        render json: @bucketlist_locations.as_json
    end
     

    def create
        @bucketlist_location = BucketlistLocation.new(fetch_params)
        bucketlist_location_validation
    end

    def update
        @bucketlist_location = BucketlistLocation.find(params[:id])
        # @bucketlist_location.update(params)
        @bucketlist_location.visited = !@bucketlist_location.visited
        @bucketlist_location.save
        render json: @bucketlist_location.visitor.as_json(include: {dark_sky_parks:{},bucketlist_locations:{}})
    end

    def destroy
        @bucketlist_location = BucketlistLocation.find(params[:id])
        @bucketlist_location.destroy();
        render json: {message: "Successfully Removed"}
    end

    private

    def fetch_params
        params.require(:bucketlist_location).permit(:visitor_id, :dark_sky_park_id)
    end

    def bucketlist_location_validation
        if @bucketlist_location.valid?
            @bucketlist_location.save
            render json: @bucketlist_location
        else
            render json: {errors: @bucketlist_location.errors.messages}
        end
    end
end

