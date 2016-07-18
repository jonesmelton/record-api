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
      # These tests will fail if the collection contains
      # members of only one gender.

      it "returns females first" do
        expect(test_records.order_by_gender[0].gender).to eq("female") 
      end
      
      it "returns males last" do
        expect(test_records.order_by_gender[-1].gender).to eq("male")
      end

      it "returns the records alphabetically by name after gender" do
        expect(test_records.order_by_gender.map { |record| record.first_name }).to eq ["Laeticia", "Mary", "Jason", "Harold"]
      end
    end

    describe "#order_by_birthday" do
      it "returns older first" do
        expect(test_records.order_by_birthday[0].first_name).to eq("Jason")
      end

      it "returns youngest last" do
        expect(test_records.order_by_birthday[-1].first_name).to eq("Mary")
      end

      it "returns the actual correct order" do
        expect(test_records.order_by_birthday.map { |record| record.first_name }).to eq(["Jason", "Laeticia", "Harold", "Mary"])
      end
    end

  end

end
