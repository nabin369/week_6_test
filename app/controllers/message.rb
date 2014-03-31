get '/:id' do
	@peep = Peep.get params[:id]
	@title = "Edit peep ##{params[:id]}"
	erb :edit
end

put '/:id' do
	p = Peep.get params[:id]
	p.message = params[:message]
	p.updated_at = Time.now
	p.save
	redirect '/'
end

get '/:id/delete' do
	@peep = Peep.get params[:id]
	@title = "Confirm deletion of note ##{params[:id]}"
	erb :delete
end

# delete '/:id' do
# 	p = Peep.get params[:id]
# 	p.destroy
# 	redirect '/'
# end