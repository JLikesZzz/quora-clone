class Question < ActiveRecord::Base
	has_many :answers, dependent: :destroy #deletes all the answer when question is deleted
	has_many :question_votes, dependent: :destroy
	has_many :question_comments, dependent: :destroy

	belongs_to :user #every question belongs to a user
	validates :question_title, presence: true
	validates :user_id, presence: true	
end
