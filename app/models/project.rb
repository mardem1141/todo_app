class Project < ApplicationRecord
	has_many :tasks, dependent: :destroy
	accepts_nested_attributes_for :tasks
	belongs_to :user
	validates :name, presence: true, length: { maximum: 100 }
	validates :user_id, presence: true
end
