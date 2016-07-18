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

      let (:sorted_by_gender) { test_records.order_by_gender }

      it "returns females first" do
        expect(sorted_by_gender[0].gender).to eq("female") 
      end
      
      it "returns males last" do
        expect(sorted_by_gender[-1].gender).to eq("male")
      end

      it "returns the records alphabetically by name after gender" do
        expect(sorted_by_gender.map { |record| record.first_name }).to eq ["Laeticia", "Mary", "Jason", "Harold"]
      end
    end

    describe "#order_by_birthday" do
      let(:sorted_by_birthday) { test_records.order_by_birthday }

      it "returns older first" do
        expect(sorted_by_birthday[0].first_name).to eq("Jason")
      end

      it "returns youngest last" do
        expect(sorted_by_birthday[-1].first_name).to eq("Mary")
      end

      it "returns the actual correct order" do
        expect(sorted_by_birthday.map { |record| record.first_name }).to eq(["Jason", "Laeticia", "Harold", "Mary"])
      end
    end

    describe "#order_by_last_name" do
      let (:sorted_by_last_name) { test_records.order_by_last_name }

      it "returns the correct order" do
        expect(sorted_by_last_name.map { |record| record.first_name }).to eq(["Laeticia", "Jason", "Mary", "Harold"])
      end
    end

  end

end
