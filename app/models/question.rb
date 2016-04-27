class Question < ActiveRecord::Base
	has_many :answers, dependent: :destroy #deletes all the answer when question is deleted
	belongs_to :user #every question belongs to a user
	validates :question_title, presence: true
	validates :user_id, presence: true

end
