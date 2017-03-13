class Project < ApplicationRecord
	belongs_to :user
	validates :name, presence: true, length: { maximum: 100 }
	validates :user_id, presence: true
end
