class ProjectsController < ApplicationController
    def index
        @projects = Project.all
      end
    
      def show
        @project = project.find(params[:id])
      end
    
      def new
        @project = current_user.projects.build
      end
    
      def create
        @project = current_user.projects.build(project_params)
    
        if @project.save
          redirect_to @project
        else
          render :new
        end
      end
    
      def edit
        @project = Project.find(params[:id])
      end
    
      def update
        @project = Project.find(params[:id])
    
        if @project.update(project_params)
          redirect_to @project
        else
          render :edit
        end
      end
    
      private
        def project_params
          params.require(:project).permit(:name, :amount)
        end
end
