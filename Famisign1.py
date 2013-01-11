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
    
    string1 = '%s%s' + checkStatus[0]
    
    status_text = alphasign.Text(string1 % (alphasign.colors.RED, alphasign.colors.GREEN), label="A", mode=alphasign.modes.INTERLOCK)
    print('\n -' + checkStatus[0])
    sign.write(status_text)
    
        
        

    
        
        

main()
