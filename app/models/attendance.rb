class Attendance < ApplicationRecord
  belongs_to :employee

  validates :date, presence: true, uniqueness: { scope: :employee_id, message: "Attendance for this date already exists" }
  validates :status, presence: true
end
