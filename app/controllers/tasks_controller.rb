class TasksController < ApiController

  before_action :find_task, except: :index
  before_action :find_tasks, only: :index

  def create

  end

  def update
  end

  def show
    render json: { task: @task }
  end

  def index
    render json: { tasks: @tasks }
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
