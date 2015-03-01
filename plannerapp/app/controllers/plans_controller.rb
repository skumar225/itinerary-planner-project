class PlansController < ApplicationController
  def index
    @companion = Companion.find session[:user_id]
    @plans = Plan.find_by(creator_id: @companion.id)
  end

  def show
<<<<<<< HEAD
    @plan = Plan.find(param[:id])  #Find a single plan
    @destination = @plan.destinations

=======
    
>>>>>>> 0c3deba399a849e3497d82d4101cd991b0d98ef2
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
