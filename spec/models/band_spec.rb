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
  describe "can have" do

	it "artists added to band if not already a member" do
	band = FactoryGirl.create(:band)
	artist = FactoryGirl.create(:artist)
	band.add_artist(artist)
	expect(band.add_artist(artist)).to eq(false)
	expect(band.artists.count).to eq(1)
	expect(artist.bands.count).to eq(1)
	end

	it "record added if not already added" do
	band = FactoryGirl.create(:band)
	rec = FactoryGirl.create(:record)
	band.add_record(rec)
	expect(band.add_record(rec)).to eq(false)
	expect(band.records.count).to eq(1)
	expect(rec.bands.count).to eq(1)
	end
  end
end
