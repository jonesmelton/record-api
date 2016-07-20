require 'grape'
require_relative 'record_collection'


  class RecordAPI < Grape::API
    format :json

    namespace :records do
      records = RecordCollection.new

      get "/" do
        records.all
      end

    end
  end

