class Api::V1::TasksController < ApplicationController
  expose :task
  expose :tasks, -> { params[:active].present? ? Task.by_active(params[:active]) : Task.search(params[:param]) }
  def index
    render json: tasks, status: :ok, each_serializer: TasksSerializer
  end

  def create
    if task.save
      render json: task, status: :created, serializer: TasksSerializer
    else
      render json: task.errors.full_messages, status: :unprocessable_entity, serializer: TasksSerializer
    end
  end

  def update
    task = Task.find(params[:id])
    if task.update(task_params)
      render json: task, status: :ok
    else
      render json: task.errors.full_messages, status: :unprocessable_entity, serializer: TasksSerializer
    end
  end

  def show
    render json: task, status: :ok, serializer: TasksSerializer
  end

  def destroy
    if task.destroy
      render json: task, status: :accepted, serializer: TasksSerializer
    else
      render json: task.errors.full_messages, status: :unprocessable_entity, serializer: TasksSerializer
    end
  end

  private
  
  def task_params
    params.require(:task).permit(:title, :description, :active)
  end
end
