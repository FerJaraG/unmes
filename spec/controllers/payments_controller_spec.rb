require 'rails_helper'

RSpec.describe PaymentsController, :type => :controller do

  describe "GET pay" do
    it "returns http success" do
      get :pay
      expect(response).to be_success
    end
  end

end
