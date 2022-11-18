require 'rails_helper'

RSpec.describe Participant, type: :model do
  
  # ----------------Association--------------------

  describe '[participant-association-test]' do
    it "Participant belongs to user." do
      t = Message.reflect_on_association(:user)
      expect(t.macro).to eq(:belongs_to)
    end

    it "Participant belongs to room." do
      t = Message.reflect_on_association(:room)
      expect(t.macro).to eq(:belongs_to)
    end
  end
end
