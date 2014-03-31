require 'spec_helper'
require_relative './helpers/add_message'

feature 'User delets the peeps' do 

	scenario 'when browsing the web page' do
		expect(Peep.count).to eq(0)

		visit '/'
		add_message('Hello')
		expect(Peep.count).to eq(1)

		visit '/:id/delete'
		click_button "Yes, Delete It!"
		expect(Peep.count).to eq(0)
	end
	
end