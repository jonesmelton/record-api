require_relative 'csv_operations'
require_relative 'record'
require 'pry'

class RecordCollection
  attr_reader :all_records

  def initialize
    @all_records = load_records
  end

  def order_by_birthday
    all_records.sort_by { |record| record.birthday }
  end

  def order_by_gender
    split_genders = all_records.group_by { |record| record.gender }
    sorted_female = sort_by_last_name(split_genders["female"])
    sorted_male = sort_by_last_name(split_genders["male"])
    sorted_female.concat(sorted_male)
  end

  private

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
