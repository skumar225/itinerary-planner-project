class DestinationsController < ApplicationController
  before_action :date_check, only: [:update, :create]
  skip_before_action :find_plan, only: [:show]

  def index
  end

  def show
    @destination = Destination.find params[:id]
    @plan = @destination.plan
  end

  def new
  end

  def edit
  end

  def create
    @destination = Destination.new destination_params
    if @destination.save
      @destination.companions << @plan.companion #auto-adding creator to destination
      redirect_to plan_destinations_path(@plan)
    else
      flash[:notice] = "Please review and correct errors in your destination details"
      redirect_to :back
    end
  end

  def update
    
  end

  def destroy
    
  end

  private
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
