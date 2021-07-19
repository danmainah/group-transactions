class ReviewsController < ApplicationController
    def create
        @project = Project.find(params[:project_id])
        @review = @project.reviews.create(review_params)
        redirect_to project_path(@project) if @project.save
      end
    
      private
        def review_params
          params.require(:review).permit(:commenter, :body)
        end
end
