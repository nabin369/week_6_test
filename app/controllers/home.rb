get '/' do
	@peep = Peep.all
	erb :home
end
