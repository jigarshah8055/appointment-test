class AvailabilitiesController < ApplicationController

  def index
  end

  def new
    @availability = Availability.new
  end

  def create
    @availability = Availability.new(availability_params)
    if @availability.save
      flash[:success] = 'Successfully updated your availability.'
      redirect_to doctor_availabilities_path
    else
      flash[:error] = @availability.errors
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def availability_params
    params.require(:availability).permit %i[ from to doctor_id ]
  end
end
