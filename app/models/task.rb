class Task < ActiveRecord::Base
	validates :complete, inclusion: {in: [true, false]}
	validates :description, presence: true
end
