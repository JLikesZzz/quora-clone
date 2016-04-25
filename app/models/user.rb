class User < ActiveRecord::Base
	validates :email, :format => {:with =>/\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/}
	validates :encrypted_password, :format => {:with =>/\S{8,}/}
end
