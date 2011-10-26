require 'rubygems'
require 'httparty'
require 'cgi'

class ChatterAdapter
  include HTTParty
  
  format :json

  #utility
  def self.set_headers
    headers "Authorization" => "OAuth #{ENV['sfdc_token']}", "Content-Type" => "text/html"
  end

  def self.root_url
    myUrl = ENV['sfdc_instance_url'].sub("{version}",ENV['sfdc_api_version'])
    @root_url = myUrl
  end
    
  #basic calls
  def self.my_news_feed
    ChatterAdapter.set_headers
    myQuery = ChatterAdapter.root_url+"chatter/feeds/news/me/feed-items"
    get(myQuery)
  end    
  
  #show what a user is following
  def self.user_following(userId)
    ChatterAdapter.set_headers
    myQuery = ChatterAdapter.root_url + "chatter/users/" + userId + "/following"
    get(myQuery)
  end
  
  #get a feed for a specific record
  def self.record_feed(recordId)
    ChatterAdapter.set_headers
    myQuery = ChatterAdapter.root_url + "chatter/feeds/record/" + recordId + "/feed-items"
    get(myQuery)
  end
  
  #get a specific chatter post
  def self.feed_item(recordId)
    ChatterAdapter.set_headers
    myQuery = ChatterAdapter.root_url + "chatter/feed-items/" + recordId
    get(myQuery)
  end
  
  #show my user information
  def self.users_me
    ChatterAdapter.set_headers
    myQuery = ChatterAdapter.root_url + "chatter/users/me"
    get(myQuery)
  end
  
  #update my own personal status
  def self.update_status(newStatus)
    ChatterAdapter.set_headers
    myQuery = ChatterAdapter.root_url + "chatter/feeds/news/me/feed-items?text=" + CGI.escape(newStatus)
    post(myQuery)
  end
  
  #add a comment to a status
  #def self.update_comment(feedItemId, newComment)
  #  ChatterAdapter.set_headers
  #  myQuery = ChatterAdapter.root_url + ""
  #end

  #TODO add Winter 12 Features here.
  
  
end
