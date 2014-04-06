get '/peeps' do
	peep = params[:message]
	user = User.get(session[:user_id])
	Peep.create(:user => user, :message => peep)
	redirect to('/')
end
