class Peep

	include DataMapper::Resource

	property :id, 				Serial
	property :message, 		Text, :required => true
	property :created_at, DateTime
	property :updated_at, DateTime

end