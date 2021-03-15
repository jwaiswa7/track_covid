require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user ) { FactoryBot.create :user }

  it "checks valid record" do 
  	 expect(user).to be_valid
  end

  it "status is valid" do 
  	user.status = "black"
  	expect(user).to_not be_valid
  end
end
