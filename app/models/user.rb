require 'bcrypt'

class User
	
	include DataMapper::Resource

	property :id,			Serial
	property :email,		String, :unique => true, :message => "Sorry, this email is already taken"
	property :password_digest,	Text

	attr_reader :password
	attr_accessor :password_confirmation

	validates_confirmation_of :password, :message => "Sorry, your password doesn't match"

	has n, :peeps, :through => Resource

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

	def self.authenticate(email, password)
		user = first(:email => email)
		
		if user && BCrypt::Password.new(user.password_digest) == password
			user
		else
			nil
		end
	end

end
