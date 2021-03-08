class CommentsController < ApplicationController
    def index
        @comments = Comment.all
        render json: @comments.as_json
    end

    def show
        @comments = Comment.find(params[:id])
        render json: @comments.to_json
    end

    def create
        @comment = Comment.new(fetch_params)
        comment_validation
    end

    private

    def fetch_params
        params.require(:comment).permit(:post, :visitor_id, :dark_sky_park_id)
    end

    def comment_validation
        if @comment.valid?
            @comment.save
            render json: @comment
        else
            render json: {errors: @comment.errors.messages}
        end
    end

end
