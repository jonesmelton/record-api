require 'grape'
require_relative 'record_collection'

class API < Grape::API
  format :json

  namespace :records do
    records = RecordCollection.new

    get "/" do
      records.all_records
    end
    
  end
end
