class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: %i[edit update show]
  before_action :check_user, only: %i[edit]
  attr_reader :appointment

  def new
    @appointment = Appointment.new()
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if check_availibility
      @appointment.save!
      redirect_to root_path, notice: 'Appointment Created Successfully'
    else
      flash[:notice] = "Doctor not available"
      render :new
    end

  end

  def destroy
    
  end

  def show
    
  end

  def edit
    unless check_user
      redirect_to root_path, notice: 'You are not authorize to do it.'
    end
  end
  
  def update
    if @appointment.update(appointment_params)
      redirect_to root_path, notice: 'Appointment Updated Successfully.'
    end
  end

  private

  def check_availibility
    doctor = User.find_by(id: params[:appointment][:doctor_id])
    date = Time.zone.strptime(params[:appointment][:date],'%m/%d/%Y %I:%M %p')
    availibility = Availibility.select { |a| a.day_date.to_date == date.to_date }
    if availibility.present?
      availibility = availibility.first
      if availibility.available? && date.to_i.between?(availibility.end_time.to_i, availibility.start_time.to_i)
        true
      else
        false
      end
    else
      false
    end
  end

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :details, :date, :patient_id, :status)
  end

  def check_user
    current_user.doctor?
  end
    
  def set_appointment
    @appointment = Appointment.find_by(id: params[:id])
  end
end
