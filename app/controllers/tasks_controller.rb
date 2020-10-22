class TasksController < ApiController

  before_action :find_task, except: %i[index create]
  before_action :find_tasks, only: :index

  def create
    @task = Task.new(task_params)
    if @task.save
      render json: @task, status: :created
    else
      render json: @task.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      render json: @task, status: :accepted
    else
      render json: @task.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    render json: @task
  end

  def index
    render json: @tasks
  end

  def destroy
    if @task.delete
      render json: @task, status: :accepted
    else
      render json: @task.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def find_tasks
    @tasks = Task.all
  end

  def task_params
    params.require(:task).permit(:title, :description, :active)
  end
end
