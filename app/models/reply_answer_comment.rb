class ReplyAnswerComment < ActiveRecord::Base
	belongs_to :answer_comment

	validates :user_id, presence: true
	validates :answer_comment_id, presence: true
	validates :reply_content, presence: true
end
