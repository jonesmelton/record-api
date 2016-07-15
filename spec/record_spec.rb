require 'rspec'
require_relative '../record'

describe Record do
  let(:record_args) { { last_name: "Bordi",
                        first_name: "Susan",
                        gender: "female",
                        favorite_color: "green",
                        birthday: "Mar 20 1947" } }

  let (:test_record) { Record.new({last_name: "Bordi",
                                   first_name: "Susan",
                                   gender: "female",
                                   favorite_color: "green",
                                   birthday: "Mar 20 1947" })}

  describe "initialization" do
    it "is instantiated successfully" do
      expect(Record.new(record_args)).to be_a(Record)
    end

    it "has the correct first name" do
      expect(test_record.first_name).to eq("Susan")
    end

    it "has the correct last name" do
      expect(test_record.last_name).to eq("Bordi")
    end

    it "has the correct gender" do
      expect(test_record.gender).to eq("female")
    end
    
    it "has a date object as birthday" do
      expect(test_record.birthday).to be_a(Date)
    end

    it "has the correct birthday" do
      expect(test_record.birthday.to_s).to eq("1947-03-20")
    end

    it "has the correct favorite color" do
      expect(test_record.favorite_color).to eq("green")
    end
    
  end
end
