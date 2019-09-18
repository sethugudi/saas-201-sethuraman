class Department < ApplicationRecord
	has_many :students
	has_many :sections, dependent: :destroy
end
