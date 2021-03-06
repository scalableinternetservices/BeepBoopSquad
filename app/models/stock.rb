# == Schema Information
#
# Table name: stocks
#
#  id          :bigint           not null, primary key
#  name        :string
#  share_price :decimal(15, 2)
#  symbol      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "net/http"
require "uri"

class Stock < ApplicationRecord
  def fetch_stock_price
    url = URI.parse('https://data.alpaca.markets/v1/last_quote/stocks/' + self.symbol)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true # need for HTTPS
    req = Net::HTTP::Get.new(url.request_uri)
    req['APCA-API-KEY-ID'] = ENV['APCA_API_KEY_ID']
    req['APCA-API-SECRET-KEY'] = ENV['APCA_API_SECRET_KEY']
    req['Accept'] = 'application/json'
    response = http.request(req)
    puts 'response code'
    puts response.code
    puts 'response body'
    response_json = JSON.parse(response.body)
    puts response_json
    self.share_price = response_json.dig('last', 'bidprice') || self.share_price
  end
end
