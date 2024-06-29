class TasksController < ApplicationController
  def all
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @aya = Task.new
  end

  def create
    task = Task.new(task_params)
    task.save
    redirect_to tasks_path
  end

  def edit
    @aya = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)
    redirect_to task_path(task)
  end

  def destroy
    restaurant = Task.find(params[:id])
    restaurant.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
