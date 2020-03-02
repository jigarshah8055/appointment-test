# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :client_appointments, class_name: 'Appointment', foreign_key: 'doctor_id'
  has_many :appointments, class_name: 'Appointment', foreign_key: 'patient_id', dependent: :destroy
  has_many :availibilities, foreign_key: 'doctor_id'

  enum user_type: {doctor: 0, patient: 1}

  after_create :set_availability

  validates :name, :phone_number, :address, :user_type, presence: true

  def set_availability
    if doctor?
      (DateTime.now..DateTime.now+30).each do |date|
        availibilities.create(day_date: date, start_time: date.middle_of_day - 2.hours,
        end_time: date.middle_of_day - 7.hours, status: 'available')
      end
    end
  end
  
end
