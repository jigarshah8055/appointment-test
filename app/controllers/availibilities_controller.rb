# frozen_string_literal: true

class AvailibilitiesController < ApplicationController
  before_action :set_availibility, only: [:edit, :update]
  def new; end

  def index
    @availibilities = current_user.availibilities
  end

  def edit; end

  def update
    if @availibility.update(availibility_params)
      redirect_to availibilities_path, notice: 'Availibility Updated Successfully'
    else
      render :edit
    end
  end
  

  private

  def set_availibility 
    @availibility = Availibility.find_by(id: params[:id])
  end

  def availibility_params
    params.require(:availibility).permit(:start_time, :end_time)
  end
end
