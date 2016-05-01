class Answer < ActiveRecord::Base
	belongs_to :user
	belongs_to :question

	has_many :answer_votes
	has_many :answer_comments

	validates :question_id, presence: true
	validates :user_id, presence: true
	validates :answer_content, presence: trues
end
