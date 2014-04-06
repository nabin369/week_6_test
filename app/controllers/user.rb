get '/users/new' do
	erb :'users/new'
end

post '/users' do
	user = User.create(:email => params[:email], 
        		    :password => params[:password],
				:password_confirmation => params[:password_confirmation])

	if user.save
		session[:user_id] = user.id
		redirect to('/')
	else
		erb :'users/new'
	end
end
