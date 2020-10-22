class Api::V1::TasksController < Api::V1::ApiController
  expose :task
  expose :tasks, ->{ Task.all}

  def index
    render json: tasks
  end

  def create
    task = Task.new(task_params)
    if task.save
      render json: task, status: :created
    else
      render json: task.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if task.update(task_params)
      render json: task, status: :accepted
    else
      render json: task.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    render json: task
  end

  def destroy
    if @task.destroy
      render json: task, status: :accepted
    else
      render json: task.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :active)
  end
end
