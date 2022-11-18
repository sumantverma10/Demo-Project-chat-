require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "users/show" do
    it "returns a success response." do 
      get :show
      expect(response).to be_success
    end
  end
end
