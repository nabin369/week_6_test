post '/peeps' do
	message = params["message"]
	Peep.create(:message => message,
							:created_at => Time.now,
							:updated_at => Time.now)

	redirect to('/')
end