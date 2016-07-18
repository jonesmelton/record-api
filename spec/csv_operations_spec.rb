require "rspec"
require_relative "../csv_operations.rb"

describe CSVParser do
  csv_records = "first_name,last_name,gender,birthday,favorite_color\nBub,TheBoulder,sometimes,may 10 2025,green\n"

  psv_records =  "first_name|last_name|gender,birthday,favorite_color\nBub|TheBoulder|sometimes|may 10 2025|green\n" 

  let(:test_records_CSV) { CSVParser.parse_CSV_collection(csv_records) }
  let(:test_records_PSV) { CSVParser.parse_CSV_collection(psv_records) }

  describe "#parse_CSV_collection with commas" do 

    it "parses without errors" do
      expect(test_records_CSV).to be_a(Array)
    end
    
    it "returns an array of hashes" do
      expect(test_records_CSV).to all(be_a Hash)
    end

    it "sets key/value pairs correctly" do
      expect(test_records_CSV[0]).to eq({first_name: "Bub", last_name: "TheBoulder", gender: "sometimes", birthday: "may 10 2025", favorite_color: "green"})
    end

  end

  describe "#parse_CSV_collection with pipes" do
    it "parses without errors" do
      expect(test_records_PSV).to be_a(Array)
    end
    it "returns an array of hashes" do
      expect(test_records_PSV).to all(be_a Hash)
    end

    it "sets key/value pairs correctly" do
      expect(test_records_PSV[0]).to eq({first_name: "Bub", last_name: "TheBoulder", gender: "sometimes", birthday: "may 10 2025", favorite_color: "green"})
    end
  end

end

