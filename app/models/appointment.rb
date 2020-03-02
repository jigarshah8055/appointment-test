class Appointment < ApplicationRecord
  belongs_to :doctor, class_name: "User"
  belongs_to :patient, class_name: "User"

  enum status: {pending: 0, confirm: 1, rejected: 2}
end
