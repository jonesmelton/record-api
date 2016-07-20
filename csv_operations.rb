require 'csv'

module CSVParser

  def self.parse_CSV_collection(csv)
    CSV.new(clean_pipes(csv), headers: true, header_converters: :symbol).map { |row| row.to_hash }
  end

  def self.parse_record(record)
    parsed_record = CSV.parse(clean_pipes(record))[0]
    {first_name: parsed_record[0],
               last_name: parsed_record[1],
               gender: parsed_record[2],
               birthday: parsed_record[3],
               favorite_color: parsed_record[4]}
  end

  # following intended to be private
  # if that were allowed in modules

  def self.clean_pipes(csv)
    csv.tr("|", ",")
  end

end

