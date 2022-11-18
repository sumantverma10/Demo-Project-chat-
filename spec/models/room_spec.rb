require 'rails_helper'

RSpec.describe Room, type: :model do
  # ------------------Validation---------------
  describe '[Room-Validation]' do
    it "must have room name" do
      room=Room.new(name:"hello").save
      expect(room).to eql(false)
    end
    
    it "must have unique room name" do
      room1=Room.new(name:"hello1").save
      room2=Room.new(name:"hello").save
      room=room1.eql?(room2)
      expect(room).to eql(false)
    end

    it "must have room name length less than 20" do
      room=Room.new(name:"r" * 21).save
      expect(room).to eql(false)
    end
  end

  # -----------------Association-----------------

  describe '[Room-Association]' do
    it "should have many messages" do
      t = Room.reflect_on_association(:messages)
      expect(t.macro).to eq(:has_many)
    end

    it "should have many participants" do
      t = Room.reflect_on_association(:participants)
      expect(t.macro).to eq(:has_many)
    end
  end

  # -------------------Scope-------------------
  describe '[Room-Scope]' do
    it "public room testing." do
      expect(RSpec.current_scope).to eq(:example)
    end
  end
end
