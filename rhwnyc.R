#################################################
## Tracey Mangin
## April 19, 2018
## RHWNYC Premiere twitter analysis
#################################################

#install.packages("twitteR")
library(twitteR)
library(stringr)
library(tidyverse)

# Change the next four lines based on your own consumer_key, consume_secret, access_token, and access_secret. 
consumer_key <- "hXcpvYmmbooRIzdOtcnmbadVM"
consumer_secret <- "fZO7LEcvwM38BtCUw4vELxbSe18PZ2Ev4K4Ibtr66XEE7zu6Ds"
access_token <- "92088460-6H4Fl0IF15PRmHe41vkJAlqtD4hZGvDyqmWtPTNRo"
access_secret <- "OhCCpQVzm3BEXy18a3PQL2hE7pWWUocmHYb3vLjX4GJcf"

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

##
rhwnyc_file <- 'data/rhwnyc_10_tweets.csv'

if(!file.exists(rhwnyc_file)) { 
  ### A bit slow so save it for future use...
  
  tw_rhwnyc_ep1 = twitteR::searchTwitter('#RHWNYC OR #rhwnyc', n = 1e5, since = '2018-04-04',
                                         until = '2018-04-05', retryOnRateLimit = 1e3)

  # 
  # tw_rhwnyc <- tw_rhwnyc_raw %>%
  #   select(status_id, created_at, text, source, 
  #          is_quote, is_retweet,
  #          hashtags, favorite_count, retweet_count,
  #          contains('place'),
  #          contains('country')) %>%
  #   unnest(hashtags)
  
  write_csv(tw_rhwnyc_raw, rhwnyc_file)
  
} else {
  
  tw_rhwnyc_raw <- read_csv(rhwnyc_file)
  
}




d = twitteR::twListToDF(tw)