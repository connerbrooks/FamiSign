#!/usr/bin/env ruby
# twittybrite.rb - display direct messages sent to a twitter account 
# on a betabrite led display.
#
# Original Source::  Philippe Creux for O2Sources (pcreux AATT o2sources DOOT com)
# New Author:: Conner Brooks for FamiLab
#
# * Please run this script as root (or using sudo)
# * The following packages are required: ruby, rubygems, libusb-dev
# * The following gems are required: twitter, betabrite, serialport
# Change Log: added support for Twitter instead of Twibot as twibot is deprecated
# 	Methods have been changed in order for better run time
#	Working on adding more functionality and cool stuff!

require 'rubygems'
require 'serialport'
require 'betabrite'
require 'twitter'
require 'iconv'

# Display text on the betabright!
# * available colors are: red, green, amber, dim_red, dim_green, brown, orange, yellow
# * available modes are: flash, hold, rotate, scroll, and more on rubyforge.org/betabrite
def betabrite (text, color = 'amber', anim = 'rotate')
  bb = BetaBrite::Serial.new('/dev/ttyUSB0') do |sign|
    sign.stringfile('0') do
      print string("dummy").green
    end
 
    sign.textfile do
      self.send(anim)
      print stringfile('0')
      print string(text.ascii).send(color).seven_stroke
    end
  end
  bb.write!
end


# That's the way we display twitter messages - feel free to custom it!
def display (message)
  betabrite "FamiTweet!", "green", "flash"
 # sleep 1
  1.times do
    #betabrite "from" + " " * 5, "green"
    #sleep 1
    #betabrite sender, "green", "hold"
    #sleep 3
    betabrite message + " " * 20
   # sleep 2
    sleep message.ascii.size / 10 + 4 # That's a hack. :)
  end
  betabrite ""
  sleep 1
end

class String
  # Return the ASCII string.
  # Looks like Ivonv does not work correctly. We use hard-coded conversions then.
  def ascii
    from = 'àâäéèêëîïôöùûüçÀÂÄÉÈÊËÎÏÔÛÇ'
    to =   'aaeeeeeiioouuucAAAEEEEIIOUC'
    return Iconv.conv('US-ASCII//TRANSLIT','UTF-8', self.tr(from, to).gsub('&lt;', '<').gsub('&gt;', '>'))
  end
end

# Seconds to h:m
def time_to(h, m = 0)
  begin
    time_now = Time.now
    return (Time.local(time_now.year, time_now.month, time_now.day, h, m) - time_now).to_i
  rescue
    sleep 1
    retry
  end
end

# Create a new thread displaying time (HH:MM) on the betabrite every minute
def display_time_thread
  Thread.new {
    while true
      @@betamutex.synchronize {
        betabrite(Time.now.strftime('%H:%M'), "dim_green", "hold")
      }
      sleep 1
      st = 61 + time_to(Time.now.hour, Time.now.min)
      sleep st
    end
  }
end



Twitter.configure do |config|
  config.consumer_key = 'kkBNhGcSFZ4kE4CRMmWcw'
  config.consumer_secret = 'C2GCFAL0UTTRUBnSglgn64BlG0jDK0vxyA86Isgm3A'
  config.oauth_token = '15356515-RdmmXpbzGZSQLddth18opg5qfPzolmWGf0LABZ8a7'
  config.oauth_token_secret = 'MRKbSA1Wglo4XmwLh1NeHn3bHfeqYuIVBAgy6ywGg'
end

Twitter.configure do |config|
  config.connection_options = Twitter::Default::CONNECTION_OPTIONS.merge(:request => { 
    :open_timeout => 5,
    :timeout => 10
  })
end

while true
    BetaBrite::Serial.new('/dev/ttyUSB0').clear_memory!
   tList = Twitter.user_timeline("familab")
   betabrite "Welcome to FamiLAB", "green", "fireworks" 
   betabrite "Please", "red", "no_smoking"  
   display tList[0].text
   betabrite "animals...nice", "green", "animal_anim"
   sleep 1
   display tList[1].text
   betabrite "Gamble everything!", "red", "slot_machine"
   display tList[2].text
   
   
end

display_time_thread
