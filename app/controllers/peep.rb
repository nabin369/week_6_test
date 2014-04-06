get '/peeps' do
	peep = params[:message]
	Peep.create(:message => peep)
	redirect to('/')
end
