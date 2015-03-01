class PlansController < ApplicationController
  def index
  end

  def show
    @plan = Plan.find(param[:id])  #Find a single plan
    @destination = @plan.destinations

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
    @destination.destroy
    @companion.destroy

    redirect_to plan_path
    
  end

  private
  def plan_params
    params.require(:plan).permit(:name, :origin, :departure_date, :return_date)
  end
end
