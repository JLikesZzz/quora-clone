class QuestionComment < ActiveRecord::Base
	has_many :reply_question_comments
	has_many :question_comment_votes

	belongs_to :question
	belongs_to :user

	validates :question_id, presence: true
	validates :user_id, presence: true
	validates :comment_content, presence: true
end
