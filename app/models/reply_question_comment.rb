class ReplyQuestionComment < ActiveRecord::Base
	belongs_to :question_comment

	validates :user_id, presence: true
	validates :question_comment_id, presence: true
	validates :reply_content, presence: true
end
