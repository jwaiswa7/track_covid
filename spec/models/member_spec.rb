require 'rails_helper'

RSpec.describe Member, type: :model do
  let(:member) { FactoryBot.create :member }

  it "is a valid record" do 
  	expect(member).to be_valid
  end
end
