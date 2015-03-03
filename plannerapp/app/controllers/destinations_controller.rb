class DestinationsController < ApplicationController
  before_action :logged_in 
  before_action :date_check, only: [:update, :create]
  skip_before_action :find_plan, only: [:show, :new]

  def index
  end

  def show
    flash[:notice] = nil
    @destination = Destination.find params[:id]
    @plan = @destination.plan
    @companions = @destination.companions
    @p_comps = Companion.all - @companions
    @reviews = @destination.reviews
  end

  def new
    flash[:notice] = nil
    @plan = Plan.find params[:plan_id]
  end

  def edit
    # @plan = Plan.find params[:plan_id]
    @destination = Destination.find params[:id]
  end

  def create
    @destination = Destination.new destination_params
    if @destination.save
      @plan.destinations << @destination
      @destination.companions << @plan.companion #auto-adding creator to destination
      redirect_to plan_destinations_path(@plan)
    else
      flash[:notice] = "Please review and correct errors in your destination details"
      redirect_to :back
    end
  end

  def update
    @destination = Destination.find params[:id]
    if @destination.update_attributes destination_params
    flash[:notice] = "#{@destination.name} has been updated"
    redirect_to @destination
    else
      flash[:notice] = "Failed to update #{@destination.name}, please check your form entries"
      redirect_to :back
    end
  end

  def add_comp
    
  end

  def destroy
    
  end

  private

  def logged_in
    unless session[:companion_id]
      flash[:alert] = "Please sign in"
      redirect_to '/'
    end
  end

  def date_check #checks that the destination date is between plan departure and return dates.
    @plan = Plan.find(params[:plan_id])
    unless @plan.date_range.include? get_date(params[:destination])
      flash[:notice] = "Your date must be between #{@plan.name}'s departure and return dates. Your date: #{get_date(params[:destination])}"
      redirect_to :back
    end
  end

  def get_date hash
    yr = hash["destination_date(1i)"].to_i
    mo = hash["destination_date(2i)"].to_i
    dy = hash["destination_date(3i)"].to_i
    Date.new(yr, mo, dy)
  end

  def find_plan
    @plan = Plan.find params[:plan_id]
  end

  def destination_params
    params.require(:destination).permit(:location, :name, :destination_date)
  end
end
