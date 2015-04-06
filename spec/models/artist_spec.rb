require 'rails_helper'

RSpec.describe Artist, type: :model do

    

  describe "with proper name and info" do
	
	it "is valid and saved" do
	  artist = FactoryGirl.create(:artist)
	  expect(artist).to be_valid
          expect(Artist.count).to eq(1)
	end      	  	
   end
  describe "without correct name" do

	it "is not valid and saved" do
	artist = Artist.create name:"", info:"yeah"
	expect(artist).not_to be_valid
	expect(Artist.count).to eq(0)
	end
  end
end
