require 'rails_helper'

RSpec.describe Band, type: :model do

describe "with proper name & formation year" do

	it "is valid and saved" do
	band = FactoryGirl.create(:band)
	expect(band).to be_valid
	expect(Band.count).to eq(1)
	end
end
describe "without proper" do

	it "name is not valid" do
	band = Band.create name:"", formed:1990
	expect(band).not_to be_valid
	end
	it "formation year is not valid" do
	band = Band.create name:"123"
	expect(band).not_to be_valid
	end

end


end
