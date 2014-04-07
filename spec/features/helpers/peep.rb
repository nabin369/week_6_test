module PeepHelpers
	def add_peep(message)
				visit '/new'
                within('#new-peep') do
        	        fill_in :message, :with => message
                	click_button 'Post'
 	        end
	end

end
