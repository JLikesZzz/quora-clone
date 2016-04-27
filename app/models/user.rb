require 'byebug'

class User < ActiveRecord::Base

	attr_accessor :password
	validates :email, :format => {:with =>/\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/}
	# validates :encrypted_password, :format => {:with =>/\S{8,}/}
	validates :email, uniqueness: true, presence: true
	validates :username, uniqueness: true

	has_many :answers
	has_many :questions



	include BCrypt

	# def password
  #   @password ||= Password.new(encrypted_password)
  # end

  def password=(new_password)
    @password = Password.create(new_password)
    self.encrypted_password = @password
  end


	def self.authenticate(emails, password)
		user = User.all
		@user = user.find_by(email: emails)
		@password = Password.new(@user.encrypted_password)
		if @password == password
			return @user
		else
			return false
		end
	end

end
