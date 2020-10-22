class TasksController < ApiController

  before_action :find_task, except: %i[index create]
  before_action :find_tasks, only: :index

  def create
    @task = Task.new(task_params)
    if @task.save
      render json: {status: 'success', message: 'Task has been created', data: @task }, status: :created
    else
      render json: {status: 'error', message: 'Task is not created', data: @task.errors }, status: :unprocessable_entity
    end
  end

  def update
    @task.save(task_params)
  end

  def show
    render json: { data: @task }
  end

  def index
    render json: { data: @tasks }
  end

  def delete

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
