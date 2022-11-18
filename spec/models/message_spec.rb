require 'rails_helper'

RSpec.describe Message, type: :model do
  # -----------------------------Validation----------------------------
  describe '[Message-Validation]' do
    it "must have message body" do
      message=Message.new(body: "this is body.",user_id:1,room_id:1).save
      expect(message).to eql(false)
    end

    it "must have length less than 4096" do
      message=Message.new(body:"h" * 4096).save
      expect(message).to eql(false)
    end
  end
  # ---------------------------Association-Test--------------------

  describe '[Message-Association]' do
    it "Message belongs to user." do
      t = Message.reflect_on_association(:user)
      expect(t.macro).to eq(:belongs_to)
    end

    it "Message belongs to room." do
      t = Message.reflect_on_association(:room)
      expect(t.macro).to eq(:belongs_to)
    end
  end
end

