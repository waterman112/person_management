class LogsController < ApplicationController

  def index
    @logs = Log.all
  end

  def new
    @log = Log.new

  end

  def create
    @log = Log.create log_params
    redirect_to @log
  end

  def show
    @log = Log.find params[:id]
  end

  def edit
    @log = Log.find params[:id]
  end

  def update
    @log = Log.find params[:id]
    @log.update log_params

    redirect_to logs_path
  end

  def destroy
    @log = Log.find params[:id]

    @log.destroy

    redirect_to logs_path
  end


  private
  def log_params
    params.require(:log).permit(:user_id, :state_id, :content, :start_date, :end_date)
  end

end
