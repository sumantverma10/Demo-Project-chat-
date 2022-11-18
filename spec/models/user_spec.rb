require 'rails_helper'

RSpec.describe User, type: :model do
  describe "[user-validations-test]" do
    it "must have email" do
      user=User.new(email: "sample@gmail.com").save
      expect(user).to eql(false)
    end
  end
# --------------Association---------------------
  describe '[User-Association]' do
    it "should have many messages" do
      t = User.reflect_on_association(:messages)
      expect(t.macro).to eq(:has_many)
    end
  end
  # ----------------Scope----------------------
  describe '[User-Scope]' do
    it "user scope testing." do
      expect(RSpec.current_scope).to eq(:example)
    end
  end
end
