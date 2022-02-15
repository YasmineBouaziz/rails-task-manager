class TasksController < ApplicationController
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
    @task = Task.new(set_task)
    @task.save
    redirect_to tasks_path(@tasks)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(set_task)
    redirect_to task_path(@task)
  end

  # def show
  #   @task = Task.find(params[:id])
  # end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  def set_task
    params.require(:task).permit(:title, :details, :complete)
  end
end
