require 'rubygems'
require 'betabrite'
require 'serialport'
require 'twitter'

Twitter.configure do |config|
  config.consumer_key = 'kkBNhGcSFZ4kE4CRMmWcw'
  config.consumer_secret = 'C2GCFAL0UTTRUBnSglgn64BlG0jDK0vxyA86Isgm3A'
  config.oauth_token = '15356515-RdmmXpbzGZSQLddth18opg5qfPzolmWGf0LABZ8a7'
  config.oauth_token_secret = 'MRKbSA1Wglo4XmwLh1NeHn3bHfeqYuIVBAgy6ywGg'
end

tList = Twitter.user_timeline("familab")


bb = BetaBrite::Serial.new('/dev/ttyUSB0') do |sign|
    sign.stringfile('1') do
      print string(tList[0].text) 
    end    
    sign.stringfile('4') do
      print string(tList[1].text)
    end
    sign.textfile do
      print string("Twitter updates: ").red + satellite_dish
      print stringfile("1")
      print string("----") + satellite_dish
      print stringfile("4")
      print string(tList[1].text).red + sail_boat
      print string(tList[2].text).green + sail_boat
    end
end
  bb.write!


