class PlansController < ApplicationController
  before_action :logged_in

  def index
    @companion = Companion.find session[:companion_id]
    @plans = Plan.where(creator_id: @companion.id)
    @message = ""
    if @plans
      @message = "Your plan(s) are listed below:"
    else
      @message = "You have not created any plans."
    end
  end

  def show
    @plan = Plan.find(params[:id]) 
    @reviews = @plan.reviews
    @destinations = @plan.destinations.order(:destination_date)
    final_dest = @destinations.last || nil
    @plan.destination_id = final_dest
    @final_dest = final_dest.name || nil #if there is an error we can try the next two lines
    # @final_dest = ""
    # @final_dest = final_dest.name if final_dest

  end

  def new
  end

  def edit
    @plan = Plan.find(params[:id]) 
  end

  def create
    @plan = Plan.new plan_params
    flash[:notice] = "Please make sure departure date is before return date"
    render "plan/new" unless @plan.dates_ordered?
    @plan.creator_id = session[:companion_id]
    if @plan.save
      flash[:notice] = "New plan created, please add destinations"
      redirect_to new_plan_destination_path(@plan)
    else
      flash[:notice] = "Please fill out the form correctly"
      render "plans/new"
    end
  end

  def update
    flash[:notice] = "Please make sure departure date is before return date"
    render "paln/new" unless @plan.dates_ordered? #need to check this too
  end

  def destroy
    @destination.destroy
    @companion.destroy

    redirect_to plan_path
    
  end

  private

  def logged_in
    unless session[:companion_id]
      flash[:alert] = "Please sign in"
      redirect_to '/'
    end
  end

  def plan_params
    params.require(:plan).permit(:name, :origin, :departure_date, :return_date)
  end
end
