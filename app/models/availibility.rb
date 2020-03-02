class Availibility < ApplicationRecord
  belongs_to :doctor, class_name: "User"

  enum status: {available: 0, unavailable: 1}
end
