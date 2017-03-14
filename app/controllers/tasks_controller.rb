class TasksController < ApplicationController
  before_action :signed_in_user

  def create
  	#if @current_project != nil
  	current_project = Project.find(params[:project_id])
    @task = current_project.tasks.build(task_params)
    if @task.save
    	@task.status = 'process'
      flash[:success] = "Task created! "+@task.name
      redirect_to root_url
    else
      redirect_to root_url
    end
   # else
   #   redirect_to root_url
   # end
  end
	

  def destroy
   @task = Task.find(params[:id])
    if @task.present?
      @task.destroy
    end
    redirect_to root_url
  end

  private

    def task_params
      params.require(:task).permit(:name)
    end  
end