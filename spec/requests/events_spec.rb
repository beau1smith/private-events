require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "GET /index" do
    it "assigns all events to @events" do
      test_event = Event.create(title: "test event", start_time: Time.now, end_time: Time.now, user_id: "1", creator_id: "1")
      get test_event_path
      expect(page).to have_content "test event"
    end
  end
end
