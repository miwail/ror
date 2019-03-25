class TaskController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    @task.save
    if @task.errors.empty?
      redirect_to task_path(@task)
    else
      puts @task.errors.full_messages
      render "new"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    if @task.errors.empty?
      redirect_to task_path(@task)
    else
      render "edit"
    end
  end

  private
    def task_params
      params.require(:task).permit(:name, :description, :start_time, :end_time)
    end

end
