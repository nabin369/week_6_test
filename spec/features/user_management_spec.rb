require 'spec_helper'

feature 'User signs up' do

	scenario 'when being logged out' do
		lambda { sign_up }.should change(User, :count).by(1)
		expect(page).should have_content("Welcome, test@test.com")
		expect(User.first.email).to eq("test@test.com")
	end
	
	scenario 'with incorrect password' do
		lambda { sign_up("a@a.com", "right", "wrong") }.should change(User, :count).by(0)
		expect(page).to have_content("Sorry, your password doesn't match")
	end	

	scenario 'with an email that is already taken' do
		lambda { sign_up }.should change(User, :count).by(1)
		lambda { sign_up }.should change(User, :count).by(0)
		expect(page).to have_content("Sorry, this email is already taken")
	end

	def sign_up(email="test@test.com", password="test", password_confirmation="test")
		visit '/users/new'
		fill_in 'email', :with => email
		fill_in 'password', :with => password
		fill_in 'password_confirmation', :with => password_confirmation
		click_button "Sign up"
	end
end

feature 'User signs in' do

	before(:each) do
		User.create(:email => "test@test.com",
				:password => "test",
				:password_confirmation => "test")
	end

	scenario 'with correct crediantial' do
		visit '/'
		expect(page).not_to have_content("Welcome, test@test.com")
		sign_in("test@test.com", "test")
		expect(page).to have_content("Welcome, test@test.com")
	end

	scenario 'with incorrect crediantial' do
		visit '/'
		expect(page).not_to have_content("Welcome, test@test.com")
		sign_in("test@test.com", "wrong")
		expect(page).not_to have_content("Welcome, test@test.com")
	end

	def sign_in(email, password)
		visit '/sessions/new'
		fill_in 'email', :with => email
		fill_in 'password', :with => password
		click_button "Sign in"
	end
end
