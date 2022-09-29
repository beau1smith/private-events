require 'rails_helper' 
require './app/models/event'

RSpec.describe User, type: :model do
  before do
    @user = User.create!({email: 'test@gmail.com', name: 'test_value', password: 'test_password', password_confirmation: 'test_password'})
  end

  describe "user" do
    it "expects user to exist" do
      expect(@user).not_to be_nil
    end

    it "expects user can be read" do
      expect(User.find_by(name: "test_value")).to eq(@user)
    end

    it "expects user can be updated" do
      @user.update(name: "John Snow")
      expect(User.find_by(name: "John Snow")).to eq(@user)
    end

    it "expects user can be destroyed" do
      @user.destroy
      expect(User.count).to eq(0)
    end
  end
end
