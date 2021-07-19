class ProjectsController < ApplicationController
  def index
    @projects = Project.includes(:groups)
    @sum = @projects.where.not(groups: nil).sum(:amount)
  end

  def grouped
    @projects = Project.includes(:groups)
    @sum = @projects.where(groups: nil).sum(:amount)
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = current_user.projects.build
  end

  def create
    id = params[:group_id] || params[:id]
    if id.nil?
      @project = current_user.projects.build(project_params)
    else
      @group = Group.find(id)
      @project = current_user.projects.build(project_params)
      @group.projects << @project
    end
    redirect_to root_path and return if @project.save

    render :new
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

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to root_path and return
  end

  private

  def project_params
    params.require(:project).permit(:name, :amount)
  end
end
