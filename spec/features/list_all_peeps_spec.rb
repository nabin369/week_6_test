require 'spec_helper'

feature 'User browses the list of links' do 

	before(:each){
		Peep.create(:message => "Welcome to chitter")
	}

	scenario "when opening the home page" do
		visit ('/')
		expect(page).to have_content("Welcome to chitter")
	end
	
end