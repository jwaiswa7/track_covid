require 'rails_helper'

RSpec.describe HotSpot, type: :model do
	let(:hot_spot) { FactoryBot.create :hot_spot }

	it "is a valid record" do 
		expect(hot_spot).to be_valid
	end
end
