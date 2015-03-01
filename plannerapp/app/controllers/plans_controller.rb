class PlansController < ApplicationController
  def index
    @companion = Companion.find session[:user_id]
    @plans = Plan.find_by(creator_id: @companion.id)
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
  def plan_params
    params.require(:plan).permit(:name, :origin, :departure_date, :return_date)
  end
end
