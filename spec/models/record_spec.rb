require 'rails_helper'

RSpec.describe Record, type: :model do

  describe "with proper name & release year" do

	it "is valid and saved" do
	record = FactoryGirl.create(:record)
	expect(record).to be_valid
	expect(Record.count).to eq(1)
	end
  end
  describe "without proper" do

	it "name is not valid" do
	record = Record.create name:"", year:1990
	expect(record).not_to be_valid
	end
	it "release year is not valid" do
	record = Record.create name:"NON"
	expect(record).not_to be_valid
	end
  end

  describe "can be" do

	it "collected by user if it's not already in user's collection" do
	user = FactoryGirl.create(:user)
	record = FactoryGirl.create(:record)
	expect(record.add_collector(user)).not_to eq(false)
	expect(record.add_collector(user)).to eq(false)
	expect(user.records.count).to eq(1)
	end

	it "removed from user's collection" do
	user = FactoryGirl.create(:user)
	record = FactoryGirl.create(:record)
	record.add_collector(user)
	expect(user.records.count).to eq(1)
	record.remove_collector(user)
	expect(user.records.count).to eq(0)
	end

  end
end
