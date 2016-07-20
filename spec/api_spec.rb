require 'rspec'
require 'airborne'
require_relative '../api'

Airborne.configure do |config|
  config.rack_app = RecordAPI
end

describe RecordAPI do
  describe "GET /" do
    it "returns 200 OK" do
      get "/records"
      expect(response.status).to eq(200)
    end
  end

  describe "GET /gender" do

    it "returns 200 OK" do
      get "/gender"
      expect_status 200
    end

    it "returns correctly formatted json" do

    end



  end

end
