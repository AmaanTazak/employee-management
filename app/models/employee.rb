class Employee < ApplicationRecord
     has_one_attached :image
     has_many :attendances, dependent: :destroy
     
	validates :first_name, :last_name, :department, :position, :hired_on, presence: true
	validates :email, presence: true, uniqueness: true
	validates :salary, numericality: { greater_than_or_equal_to: 0 }
	 def self.ransackable_attributes(auth_object = nil)
    ["first_name", "last_name", "email", "position", "department", "salary", "hired_on", "created_at", "updated_at"]
  end
   def self.ransackable_associations(auth_object = nil)
    ["image_attachment", "image_blob"]
  end

	def name
		"#{first_name} #{last_name}"
	end
end
