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
    
    tweet1 = '%s' + checkStatus[0]
    tweet2 = '%s' + checkStatus[1]   

    twitter_message_1 = alphasign.Text(tweet1 % (alphasign.colors.RED), label="A", mode=alphasign.modes.SCROLL)
    print('\n -' + checkStatus[0])
        
    twitter_message_2 = alphasign.Text(tweet2 % (alphasign.colors.ORANGE), label="A", mode=alphasign.modes.SCROLL)   
    print('\n -' + checkStatus[1])
    
    sign.allocate((twitter_message_1, twitter_message_2)
    
    for obj in (twitter_message_1, twitter_message_2):
	sign.write(obj) 
        
        

main()
