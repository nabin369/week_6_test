get '/' do
	@peep = Peep.all :order => :id.desc
	erb :home
end
