require 'rails_helper'



RSpec.describe User, type: :model do



   it "has the username set correctly" do
    user = User.new username:"Pekka"

    expect(user.username).to eq("Pekka")
   end

  it "is not saved without a password" do
    user = User.create username:"Pekka"

    expect(user).not_to be_valid
    expect(User.count).to eq(0)
  end

  describe "with a proper password" do
    let(:user){ User.create username:"Pekka", password:"Secret1", password_confirmation:"Secret1" }

    it "is saved" do
      expect(user).to be_valid
      expect(User.count).to eq(1)
    end

  end

  describe "without a proper password is not validated" do

   it "if the password does not have an uppercase letter" do
   user = User.create username:"Pekka", password:"secret1", password_confirmation:"secret1"
expect(user).not_to be_valid
    expect(User.count).to eq(0)
  end
 
  it "or if the password and password confirmation does not match" do
   user = User.create username:"Pekka", password:"Se1", password_confirmation:"Se"
expect(user).not_to be_valid
    expect(User.count).to eq(0)
  end
end

end
