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
newTweet = tList[0].text

BetaBrite::Serial.new('/dev/ttyUSB0').clear_memory!

bb = BetaBrite::Serial.new('/dev/ttyUSB0') do |sign|
    sign.stringfile('0') do
      print string("testing this carp")
    end
    
    
         
    sign.textfile do
     self.send('rotate')
     print stringfile("0")
     print string("doo ittttt").red
     # print string('Do something!')
     # print string("FamiLAB ").seven_shadow + diskette
     # print string(" Twitter updates: ").red + satellite_dish
     # print string(tList[0].text + " ").green + satellite_dish
     # print string(tList[1].text + " ").red + satellite_dish
     # print string(tList[2].text).green
    end 
end
  bb.write!



