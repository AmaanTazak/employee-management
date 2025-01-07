class Attendance < ApplicationRecord
  belongs_to :employee

  validates :date, presence: true, uniqueness: { scope: :employee_id, message: "Attendance for this date already exists" }
  validates :check_in, :check_out, :status, presence: true
end
