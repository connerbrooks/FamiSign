require 'rubygems'
require 'betabrite'
require 'serialport'

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
