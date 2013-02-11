# Twitter.configure do |config|
#  config.consumer_key = 'kkBNhGcSFZ4kE4CRMmWcw'
#  config.consumer_secret = 'C2GCFAL0UTTRUBnSglgn64BlG0jDK0vxyA86Isgm3A'
#  config.oauth_token = '15356515-RdmmXpbzGZSQLddth18opg5qfPzolmWGf0LABZ8a7'
#  config.oauth_token_secret = 'MRKbSA1Wglo4XmwLh1NeHn3bHfeqYuIVBAgy6ywGg'
#end

#tList = Twitter.user_timeline("familab")
include 'betabrite'
require 'serialport'
require 'twitter'

bb = BetaBrite::Serial.new('/dev/ttyUSB0') do |sign|
    sign.stringfile('0') do
      print string("cruel").red
    end

    sign.textfile do
      print string("Goodbye ").green
      print stringfile("0")
      print string(" world.").green + sail_boat
    end
  end
  bb.write!


