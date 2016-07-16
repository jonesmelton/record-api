require "rspec"
require_relative "../csv_operations.rb"

describe CSVParser do
  csv_records = "first_name,last_name,gender,birthday,favorite_color\nBub,TheBoulder,sometimes,may 10 2025,green\n"

  psv_records =  "first_name|last_name|gender,birthday,favorite_color\nBub|TheBoulder|sometimes|may 10 2025|green\n" 

  describe "#parse_CSV_collection with commas" do 

    it "parses without errors" do
      expect(CSVParser.parse_CSV_collection(csv_records)).to be_a(Array)
    end
    
    it "returns an array of hashes" do
      expect(CSVParser.parse_CSV_collection(csv_records)).to all(be_a Hash)
    end

    it "sets key/value pairs correctly" do
      expect(CSVParser.parse_CSV_collection(csv_records)[0]).to eq({first_name: "Bub", last_name: "TheBoulder", gender: "sometimes", birthday: "may 10 2025", favorite_color: "green"})
    end

  end

end

