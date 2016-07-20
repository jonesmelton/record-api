require 'rspec'
require 'airborne'
require_relative '../api'

Airborne.configure do |config|
  config.rack_app = RecordAPI
end

describe RecordAPI do
  describe "GET" do
    it "returns a json" do
      get "/records"
      expect(response.status).to eq(200)
    end
  end
end
