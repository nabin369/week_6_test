def add_message(message)
		within('#new-peep') do
			fill_in 'message', :with => message
			click_button 'Post'
		end
end