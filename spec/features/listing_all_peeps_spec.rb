require 'spec_helper'

feature 'User browse the list of peep' do

	before(:each) do
		Peep.create(:message => "test")
	end

	scenario 'when opening the homepage' do
		visit '/'
		expect(page).to have_content("test")
	end
end
