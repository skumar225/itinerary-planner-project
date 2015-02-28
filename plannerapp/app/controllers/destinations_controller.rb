class DestinationsController < ApplicationController
  before_action :date_check, only: [:update, :create]

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    
  end

  def update
    
  end

  def destroy
    
  end

  private
  def date_check #we need to nest destination routes in plan routes
    # @plan = Plan.find(params[:plan_id])
  end

  def destination_params
    params.require(:destination).permit(:location, :name, :destination_date)
  end
end
