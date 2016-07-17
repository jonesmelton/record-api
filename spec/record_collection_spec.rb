require 'rspec'
require_relative '../record'
require_relative '../record_collection'

describe RecordCollection do

  let(:test_records) { RecordCollection.new }

  describe "initialization" do

    it "returns a RecordCollection" do
      expect(test_records).to be_a(RecordCollection)
    end

    it "loads the csv file" do
      expect(test_records.all_records).to all(be_a Record)
    end
  end

  describe "sorting" do

    describe "#order_by_gender" do
      it "returns females first" do
        expect(test_records.order_by_gender.map { |record| record.first_name } ).to eq(["Laeticia", "Mary", "Jason"])
      end
    end

  end

end
