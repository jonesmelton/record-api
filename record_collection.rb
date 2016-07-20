require_relative 'csv_operations'
require_relative 'record'
require 'pry'
require 'csv'

class RecordCollection
  attr_reader :all_records

  def initialize
    @all_records = load_records
  end

  def order_by_birthday
    all_records.sort_by { |record| record.birthday }
  end

  def order_by_last_name
    sort_by_last_name(all_records)
  end

  def all
    format_records(all_records)
  end

  def gender
    format_records(order_by_gender)
  end

  def birthday
    format_records(order_by_birthday)
  end

  def name
    format_records(order_by_last_name)
  end

  def order_by_gender
    split_genders = all_records.group_by { |record| record.gender }
    sorted_female = sort_by_last_name(split_genders["female"])
    sorted_male = sort_by_last_name(split_genders["male"])
    sorted_female.concat(sorted_male)
  end

  def self.add_record(record)
    CSV.open("db/records.csv", "a") do |csv|
      csv << record.values
    end
  end

  def save_all_records!
    headers = ["first_name", "last_name", "gender", "birthday", "favorite_color"]
    CSV.open("db/records.csv", "wb") do |csv|
      csv << headers
      all_records.each do |record|
        csv << record.to_hash.values
      end
    end
  end

  private

  def format_records(records)
   records.map { |record| record.to_hash }
  end

  def sort_by_last_name(collection)
    collection.sort_by { |record| record.last_name }
  end

  def load_records
    raw_csv = File.read("db/records.csv")
    CSVParser.parse_CSV_collection(raw_csv).map do |row|
      Record.new(row)
      end
  end

end
