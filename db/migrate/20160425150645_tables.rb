class Tables < ActiveRecord::Migration
	def change
		create_table :users do |t|
			t.string :email
			t.string :username
			t.string :encrypted_password
			t.datetime :created_at
			t.datetime :updated_at
		end

		create_table :answers do |a|
			a.integer :question_id
			a.integer :user_id
			a.string :answer_content
			a.datetime :created_at
			a.datetime :updated_at
		end

		create_table :questions do |q|
			q.integer :user_id
			q.string :question_title
			q.string :question_desc
			q.datetime :created_at
			q.datetime :updated_at
		end
	end
end
