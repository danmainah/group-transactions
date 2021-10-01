class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @projects = @group.projects
  end

  def new
    @group = current_user.groups.build
  end

  def create
    @group = current_user.groups.build(group_params)

    if @group.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @group = group.find(params[:id])
  end

  def update
    @group = group.find(params[:id])

    if @group.update(group_params)
      redirect_to @group
    else
      render :edit
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
