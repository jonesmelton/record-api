require 'grape'
require_relative 'record_collection'


  class RecordAPI < Grape::API
    format :json

    #for testing the api is online
    resource :records do
      get do
      end
    end

    resource :gender do
      records = RecordCollection.new

      get do
        records.gender
      end

    end
  end

