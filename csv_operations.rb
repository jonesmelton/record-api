require 'csv'

module CSVParser

  def self.parse_CSV_collection(csv)
    CSV.new(csv, headers: true, header_converters: :symbol).map { |row| row.to_hash }
  end

  def self.remove_pipes

  end

end

