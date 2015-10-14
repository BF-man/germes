class WorkerController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  before_filter :workers_to_show, :only => [:index]

  def index
  end

  def update
    worker = Worker.where(id: params[:id]).first
    @error = t(:error_update_text) unless worker.present? && worker.update(worker_params)
    @worker_id = params[:id]
  end

  private
  def worker_params
    params.require(:worker).permit(:task)
  end

  private
  def workers_to_show
    @workers = Worker.order(:name)
  end
end


