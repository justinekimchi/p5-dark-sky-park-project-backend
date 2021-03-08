class LikesController < ApplicationController
    before_action :find_dark_sky_park
    before_action :find_like, only: [:destroy]

    def index
        @likes = Like.all
        render json: @likes.as_json
    end

    # def show 
    #     @likes= Like.find(params[:id])
    #     render json: @likes
    # end


    def create
        if already_liked?
            flash[:notice] = "You've already liked this park!"
        else
            @dark_sky_park.likes.create(visitor_id: current_visitor.id)
    
    def destroy
         if !(already_liked?)
             flash[:notice] = "Can't unlike"
        else
            @like.destroy
    end

    private

    private
    def find_dark_sky_park
        @dark_sky_park = DarkSkyPark.find_by(id: params[:dark_sky_park_id])
    end
    def already_liked?
        Like.where(visitor_id: current_visitor.id, dark_sky_park_id:
        params[:dark_sky_park_id]).exists?
    end
    def find_like
        @like = @dark_sky_park.likes.find(params[:id])
    end
end
