class TasksController < ApplicationController
    def index
      @categories = Category.all
      @tasks = Task.where(status: 'incomplete')
      @task = Task.new
      @category = Category.find_by(id: params[:category_id])
      @tasks = @category.tasks if @category.present?
    end
  
    def create
      @task = Task.new(task_params)
      @task.status = 'incomplete'
      if @task.save
        redirect_to tasks_path, notice: 'สร้าง Task เสร็จเรียบร้อยแล้ว'
      else
        render :index
      end
    end
  
    def complete
      @task = Task.find(params[:id])
      @task.update(status: 'complete')
      redirect_to tasks_path, notice: 'Task ได้ถูกทำเครื่องหมายว่าเสร็จเรียบร้อย'
    end
  
    private
  
    def task_params
      params.require(:task).permit(:status)
    end
  end
  
