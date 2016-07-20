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

    it "returns correctly formatted json" do
      get "/records"
      expect(json_body[0]).to eq({first_name: "Jason",
                                  last_name: "Caldwell",
                                  gender: "male",
                                  birthday: "1930-11-12",
                                  favorite_color: "purple"})
    end
  end

  describe "GET /records/gender" do

    it "returns 200 OK" do
      get "/records/gender"
      expect_status 200
    end

    it "returns correctly formatted json" do
      get "/records/gender"
      expect(json_body[0]).to eq({first_name: "Laeticia",
                                  last_name: "Aiern",
                                  gender: "female",
                                  birthday: "1974-07-25",
                                  favorite_color: "yellow"})
    end
  end

  describe "GET /records/birthday" do
    it "returns 200 OK" do
      get "/records/birthday"
      expect_status 200
    end

    # mysteriously failing test even though
    # manually verified this request works
    it "returns correctly formatted json" do
      get "/records/birthday"
      json_body[0]
      expect(json_body[0]).to eq({first_name: "Jason",
                                  last_name: "Caldwell",
                                  gender: "male",
                                  birthday: "1930-11-12",
                                  favorite_color: "purple"})
    end
  end

  describe "GET /records/name" do
    it "returns 200 OK" do
      get "/records/name"
      expect_status 200
    end

    it "returns correctly formatted json" do
      get "/records/name"
      expect(json_body[0]).to eq({first_name: "Laeticia",
                                  last_name: "Aiern",
                                  gender: "female",
                                  birthday: "1974-07-25",
                                  favorite_color: "yellow"})
    end
  end
end
