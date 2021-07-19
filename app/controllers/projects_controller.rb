class ProjectsController < ApplicationController
    def index
        @projects = Project.includes(:groups)
        @sum = @projects.where.not(groups: nil).sum(:amount)
      end
     def  grouped
       @projects = Project.includes(:groups)
       @sum = @projects.where(groups: nil).sum(:amount)
      
     end
    
      def new
        @project = current_user.projects.build
      end
      
      def create 
        id = params[:group_id] || params[:id]
        if  id == nil
            @project = current_user.projects.build(project_params)
        else
           @group = Group.find(id) 
           @project = current_user.projects.build(project_params)
           @group.projects << @project
         end
          if @project.save
            redirect_to root_path and return
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
