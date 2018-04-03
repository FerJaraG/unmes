require 'spec_helper'

describe PagesController do
  describe "GET home" do
  	it "has a 200 status code" do
		get :home
		expect(response.status).to eq(200)
	end
  end

  describe "GET casos" do
  	it "has a 200 status code" do
		get :casos
		expect(response.status).to eq(200)
	end
  end

end

