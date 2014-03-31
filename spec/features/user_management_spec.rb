require 'spec_helper'
require_relative 'helpers/session'

include SessionHelpers


feature "User signs up" do 

	scenario "when being logged out" do
		lambda {sign_up}.should change(User, :count).by(1)
		expect(page).to have_content("alice")
		expect(User.first.name).to eq("alice example")
	end

	scenario "with a password that doesn't match" do
		lambda { sign_up('a@a.com', 'alice example', 'alice', 'pass', 'wrong')}.should change(User, :count).by(0)
		expect(current_path).to eq('/users')
		expect(page).to have_content("Sorry, Password does not match the confirmation")
	end

	scenario "with email that is already taken" do
		lambda { sign_up }.should change(User, :count).by(1)
		lambda { sign_up }.should change(User, :count).by(0)
	end
end
	
	feature "User signs in" do
		
		before(:each) do
			User.create(:email => "test@test.com",
									:name => "test",
									:user_name => "test",
									:password => "orange",
									:password_confirmation => "orange")
		end	

		scenario "with correct credential" do
			visit '/'
			expect(page).not_to have_content("Welcome, test")
			sign_in('test@test.com', 'orange')
			expect(page).to have_content("Welcome, test")
		end

		scenario "with incorrect credentials" do
			visit '/'
			expect(page).not_to have_content("Welcome, test")
			sign_in('test@test.com', 'banana')
			expect(page).not_to have_content("Welcome, test")
		end
	end

	feature "User signs out" do

		before(:each) do
			User.create(:email => "test@test.com",
									:name => "test",
									:user_name => "test",
									:password => "orange",
									:password_confirmation => "orange")
		end

		scenario "while being signed in" do
			sign_in("test@test.com", "test")
			click_button "Sign out"
			expect(page).to have_content("Good bye!")
			expect(page).not_to have_content("Welcome, test")
		end
	end






