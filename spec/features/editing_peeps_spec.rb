require 'spec_helper'
require_relative './helpers/add_message'

feature 'User edit the peep' do 

	scenario 'when browsing the web page' do
		expect(Peep.count).to eq(0)

		visit '/'
		add_message('hello')
		expect(Peep.count).to eq(1)

		visit '/:id'
		update_message('hello world')
		expect(Peep.count).to eq(1)

		p = Peep.first
		expect(p.message).to eq('hello world')
	end


	def update_message(message)
		within('#edit') do
			fill_in 'message', :with => message
			click_button 'Post'
		end
	end

end