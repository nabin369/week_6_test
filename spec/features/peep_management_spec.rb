require 'spec_helper'
require_relative './helpers/session'
require_relative './helpers/peep'

include SessionHelpers
include PeepHelpers

feature 'User adds a new peep' do

	before(:each) do
                User.create(:email => "test@test.com",
                                :password => "test",
                                :password_confirmation => "test")
        end

	scenario 'when signed in' do
		visit '/'
		expect(page).not_to have_button("Post")	
		sign_in("test@test.com", "test")
		expect(Peep.count).to eq(0)	
		add_peep("testing")
		peep = Peep.first
		expect(peep.message).to eq("testing")
		expect(page).to have_content("test@test.com")
		expect(page).to have_content("created at:")
	end
end

feature 'User browse the list of peep' do

        before(:each) do
                User.create(:email => "test@test.com",
                                :password => "test",
                                :password_confirmation => "test")
        	sign_in("test@test.com", "test")
		add_peep("testing")	
	end

        scenario 'when opening the homepage' do
                visit '/'
                expect(page).to have_content("test")
        end
end
