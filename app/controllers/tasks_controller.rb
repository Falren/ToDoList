class TasksController < ApiController

  before_action :find_task

  def create

  end

  def update
  end

  def show
    render json: {
      id: @task.id,
      title: @task.title,
      description: @task.description,
      active: @task.active
    }
  end

  def index
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
