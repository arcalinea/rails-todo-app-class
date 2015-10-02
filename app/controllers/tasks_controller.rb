class TasksController < ApplicationController

	def index
		@tasks = Task.all
		@task = Task.new
	end

	# def show
	# 	@task = Task.find(params[:id])
	# end

	def new
		@task = Task.new
	end

	def edit
		@task = Task.find(params[:id])
	end

	def create
		@task = Task.new(task_params)
		p "%" * 50
		# p data
		p task_params

		if @task.save
			if request.xhr?
				# @task = Task.new(description: data)
				render partial: 'show', layout: false
			else
				redirect_to tasks_path
			end
		else
			render 'index'
		end
	end

	def update
		@task = Task.find(params[:id])

		if @task.update(task_params)
			redirect_to tasks_path
		else
			redirect_to tasks_path
		end
	end

	def destroy
		@task = Task.find(params[:id])
		@task.destroy

		redirect_to tasks_path
	end

	def active
		@tasks = Task.where(complete: false)
		@task = Task.new
		render 'index'
	end

	def completed
		@tasks = Task.where(complete: true)
		@task = Task.new
		render 'index'
	end

	private
		def task_params
			params.require(:task).permit(:description, :complete)
		end

end
