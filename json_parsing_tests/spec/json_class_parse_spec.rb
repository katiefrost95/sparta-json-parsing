require 'spec_helper'

describe 'testing the exchange rates' do

  before(:all) do
    @exchange_rates = ParseJson.new('json_exchange_rates.json')
  end

    it 'should be a hash' do
      expect(@exchange_rates.json_file).to be_kind_of(Hash)
    end

    it 'should respond with a date string next to date key and to be 10 characters' do
      expect(@exchange_rates.get_date_value).to be_kind_of(String)
      expect(@exchange_rates.get_date_value.length).to eq 10
    end

#using method get_base_value from json_class_parse file to eliminate code and make it resuable
    it 'should have base to be euroes' do
      expect(@exchange_rates.get_base_value).to eq("EUR")
    end

    it 'should respond with a string in the keys and 3 letters long' do
      @exchange_rates.get_rates_value.each do |key, value|
        expect(key).to be_kind_of(String)
        expect(key.length).to eq 3
      end
    end

    it 'should respond with with a float value next to currencies greater than 0' do
      @exchange_rates.get_rates_value.each do |key, value|
        expect(value).to be_kind_of(Float)
        expect(value).to be > 0
      end
    end

    it 'should contain keys which do not exceed 31' do
      expect(@exchange_rates.get_rates_value.length).to be <= 31
    end
end
