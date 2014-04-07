get '/' do
	@peep = Peep.all :order => :id.desc
	erb :index
end
