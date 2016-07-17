require_relative 'csv_operations'

class RecordCollection
  attr_reader :all_records

  def initialize
    @all_records = load_records
  end

  private

  def load_records
    raw_csv = File.read("db/records.csv")
    CSVParser.parse_CSV_collection(raw_csv).map do |row|
      Record.new(row)
      end
  end

end
