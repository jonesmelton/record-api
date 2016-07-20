require 'grape'
require_relative 'record_collection'


  class RecordAPI < Grape::API
    format :json

    #for testing the api is online
    resource :records do
      records = RecordCollection.new
      get do
      end

      get :gender do
        records.gender
      end

      get :birthday do
        records.birthday
      end

    end


  end

