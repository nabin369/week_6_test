get '/' do
	@peeps = Peep.all :order => :id.desc
	@title = "All Peeps"
	erb :home
end