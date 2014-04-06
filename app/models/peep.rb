class Peep

	include DataMapper::Resource

	property :id,		Serial
	property :message,	String
	property :created_at, 	Time	
	has 1, :user, :through => Resource
end
