require 'csv'

module CSVParser

  def self.parse_CSV_collection(csv)
    CSV.new(clean_pipes(csv), headers: true, header_converters: :symbol).map { |row| row.to_hash }
  end

  def self.clean_pipes(csv)
    csv.gsub("|", ",")
  end

end

