require 'spec_helper'
require_relative './helpers/add_message'

feature "User adds a new message" do
	
	scenario "when browising the homepage" do
		expect(Peep.count).to eq(0)
		visit('/')
		add_message("Hello world")

		expect(Peep.count).to eq(1)
		peep = Peep.first
		expect(peep.message).to eq("Hello world")
	end

end