require 'rspec'
require_relative '../record_collection'

describe RecordCollection do
  describe "initialization" do
    let(:test_records) { RecordCollection.new }

    it "returns a RecordCollection" do
      expect(RecordCollection.new).to be_a(RecordCollection)
    end

    xit "loads the csv file" do
     
    end

  end
end
