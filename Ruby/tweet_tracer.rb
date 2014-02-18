require 'nokogiri'
require 'httparty'
 
def next_tweet tweet_url
  response = HTTParty.get tweet_url
  tweet_link = Nokogiri::XML( response ).xpath( "//a/@data-expanded-url" ).first
  p tweet_link.value unless tweet_link.nil?
end
 
def find_source url
  tweet = next_tweet( url )
  tweet ? find_source( tweet ) : url
end
 
find_source "https://twitter.com/waneka/status/433519520842395648"
