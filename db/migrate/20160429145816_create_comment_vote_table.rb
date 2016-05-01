class CreateCommentVoteTable < ActiveRecord::Migration
	def change

		create_table :question_votes do |v|
			v.integer :question_id
			v.interger :user_id
			v.boolean :upvote
			v.datetime :created_at
			v.datetime :updated_at
		end

		create_table :answer_votes do |v|
			v.integer :answer_id
			v.interger :user_id
			v.boolean :upvote
			v.datetime :created_at
			v.datetime :updated_at
		end

		create_table :question_comment_votes do |v|
			v.integer :question_comment_id
			v.integer :question_id
			v.interger :user_id
			v.boolean :upvote
			v.datetime :created_at
			v.datetime :updated_at
		end

		create_table :answer_comment_votes do |v|
			v.integer :answer_comment_id
			v.integer :answer_id
			v.interger :user_id
			v.boolean :upvote
			v.datetime :created_at
			v.datetime :updated_at
		end

		create_table :question_comments do |c|
			c.string :comment_content
			c.integer :question_id
			c.interger :user_id
			c.datetime :created_at
			c.datetime :updated_at
		end

		create_table :answer_comments do |c|
			c.string :comment_content
			c.integer :answer_id
			c.interger :user_id
			c.datetime :created_at
			c.datetime :updated_at
		end

		create_table :reply_question_comments do |c|
			c.interger :user_id
			c.string :reply_content
			c.integer :question_comment_id
			c.datetime :created_at
			c.datetime :updated_at
		end


		create_table :reply_answer_comments do |c|
			c.interger :user_id
			c.string :reply_content
			c.integer :answer_comment_id
			c.datetime :created_at
			c.datetime :updated_at
		end

	end
end
