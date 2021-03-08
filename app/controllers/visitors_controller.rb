class VisitorsController < ApplicationController
    def index
        @visitors= Visitor.all
        render json: @visitors.as_json(include: {bucketlist_locations:{}})
    end

    def show
        @visitors= Visitor.find(params[:id])
        render json: @visitors.to_json(include: {bucketlist_locations:{}})
    end

    def create
        @visitor = Visitor.new(username: params[:username])
        user_validation
    end

    def update
        @visitor = Visitor.find(params[:id])
        @visitor.update(user_params)
        render json: @visitor
    end

    def destroy
        @visitor=Visitor.find(params[:id])
        BucketlistLocation.destroy_by(visitor_id: @visitor.id)
        @visitor.delete
    end

    private

    def user_validation
        if @visitor.valid?
            @visitor= Visitor.find_or_create_by(username: @visitor.username)
            render json: @visitor.as_json(include: {bucketlist_locations:{}})
        else
            render json: {errors: @visitor.errors.messages}
        end
    end

    def user_params
        params.require(:visitor).permit(:username, :password)
    end
end

