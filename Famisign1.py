import time
import alphasign
import twitter

def main():
    sign = alphasign.Serial(device='/dev/ttyUSB0')
    sign.connect()
    sign.clear_memory()
    
    #initialize twitter api keys
    api = twitter.Api(consumer_key='kkBNhGcSFZ4kE4CRMmWcw',
    consumer_secret='C2GCFAL0UTTRUBnSglgn64BlG0jDK0vxyA86Isgm3A',
    access_token_key='15356515-RdmmXpbzGZSQLddth18opg5qfPzolmWGf0LABZ8a7',
    access_token_secret='MRKbSA1Wglo4XmwLh1NeHn3bHfeqYuIVBAgy6ywGg')

    #get statuses
    status = api.GetUserTimeline('familab')
    checkStatus = [s.text for s in status]
    
    tweet1 = checkStatus[0] + '%s%s'
    tweet2 = '%s' + checkStatus[1]   
    tweet3 = '%s' + checkStatus[2]
    
    #Create objects to work with
    counter_str = alphasign.String(size=14, label="1")
    counter_txt = alphasign.Text("Counter value: %s%s" % (alphasign.colors.RED, counter_str.call()), label="A", mode=alphasign.modes.HOLD)    

    twitter_message_1 = alphasign.Text(tweet1 % (alphasign.colors.RED, counter_str.call()), label="A", mode=alphasign.modes.HOLD)
    print('\n -' + checkStatus[0])
        
    twitter_message_2 = alphasign.Text(tweet2 % (alphasign.colors.ORANGE), label="A", mode=alphasign.modes.SCROLL)   
    print('\n -' + checkStatus[1])
   
    twitter_message_3 = alphasign.Text(tweet3 % (alphasign.colors.ORANGE), label="A", mode=alphasign.modes.SCROLL)   
    print('\n -' + checkStatus[3])
    
    counter_str = alphasign.String(size=14, label="1") 
    
     
    
    sign.allocate((counter_str, counter_txt, twitter_message_1, twitter_message_2, twitter_message_3))  
    sign.set_run_sequence((counter_txt, twitter_message_1, twitter_message_2, twitter_message_3,))
#    for obj in (counter_str, counter_txt, twitter_message_1, twitter_message_2, twitter_message_3):
#	sign.write(obj) 

#    counter_value = 0
#    while True:
#	counter_str.data = counter_value
#	sign.write(counter_str)
#	counter_value += 1
#	time.sleep(1)
    
        

main()
