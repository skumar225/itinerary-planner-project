class PlansController < ApplicationController
  def index
    @companion = Companion.find session[:companion_id]
    @plans = Plan.find_by(creator_id: @companion.id)
    @message = ""
    if @plans
      @message = "Your plan(s) are listed below:"
    else
      @message = "You have not created any plans."
    end
  end

  def show
    
  end

  def new
  end

  def edit
  end

  def create
    @plan = Plan.new plan_params
    @plan.creator_id = session[:companion_id]
    if @plan.save
      flash[:notice] = "New plan created, please add destinations"
      redirect_to new_plan_destination_path
    else
      flash[:notice] = "Please fill out the form correctly"
      render "plans/new"
    end
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
