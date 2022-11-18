require 'rails_helper'

RSpec.describe "Rooms", type: :request do
  describe "GET rooms/room" do
    it "returns a success response." do 
      get :rooms_room
      expect(response).to be_success
    end
  end 
end
