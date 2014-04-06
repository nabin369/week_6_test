require 'spec_helper'

describe Peep do

	context 'Demonstration of how  database works' do

		it 'should be created and retrieved from db' do
			expect(Peep.count).to eq(0)
			Peep.create(:message => "test")
			expect(Peep.count).to eq(1)
			
			peep = Peep.first
			expect(peep.message).to eq("test")
			peep.destroy
			expect(Peep.count).to eq(0)
		end
	end
end 

