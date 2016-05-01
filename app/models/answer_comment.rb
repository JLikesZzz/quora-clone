class AnswerComment < ActiveRecord::Migration
	has_many :reply_answer_comments
	has_many :answer_comment_votes

	belongs_to :answer
	belongs_to :user

	validates :user_id, presence: true
	validates :answer_id, presence: true
	validates :comment_content, presence: true
end
