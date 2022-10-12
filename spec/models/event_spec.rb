require 'rails_helper' 
require './app/models/event'

RSpec.describe Event, type: :model do
  before do
    @user = User.create!({email: 'test@gmail.com', name: 'test_value', password: 'test_password', password_confirmation: 'test_password'})
    @event = Event.create({title: 'test event', start_time: Time.now, end_time: Time.now, user_id: @user.id, creator_id: @user.id})
  end

  describe "event" do
    it "expects event to exist" do
      expect(@event).not_to be_nil
    end

    it "expects event can be read" do
      expect(Event.find_by(title: "test event")).to eq(@event)
    end

    it "expects event can be updated" do
      @event.update(title: "New test event")
      expect(Event.find_by(title: "New test event")).to eq(@event)
    end

    it "expects event can be destroyed" do
      @event.destroy
      expect(Event.count).to eq(0)
    end
  end
end
