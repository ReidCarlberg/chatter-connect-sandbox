require 'rubygems'
require 'httparty'
require 'cgi'

class ChatterAdapter
  include HTTParty
  
  format :json

  def self.set_headers
    headers 'Authorization' => "OAuth #{ENV['sfdc_token']}"
  end

  def self.root_url
    myUrl = ENV['sfdc_instance_url'].sub("{version}",ENV['sfdc_api_version'])
    @root_url = myUrl
  end
    
  def self.my_news_feed
    ChatterAdapter.set_headers
    myQuery = ChatterAdapter.root_url+"chatter/feeds/news/me/feed-items"
    get(myQuery)
  end    
  
  def self.user_following(userId)
    ChatterAdapter.set_headers
    myQuery = ChatterAdapter.root_url + "chatter/users/" + userId + "/following"
    get(myQuery)
  end
  
  def self.record_feed(recordId)
    ChatterAdapter.set_headers
    myQuery = ChatterAdapter.root_url + "chatter/feeds/record/" + recordId + "/feed-items"
    get(myQuery)
  end
  
  def self.users_me
    ChatterAdapter.set_headers
    myQuery = ChatterAdapter.root_url + "chatter/users/me"
    get(myQuery)
  end
  
  def self.update_status(newStatus)
    ChatterAdapter.set_headers
    myQuery = ChatterAdapter.root_url + "chatter/feeds/news/me/feed-items?text=" + CGI.escape(newStatus)
    post(myQuery)
  end
  
  def self.update_comment(feedItemId, newComment)
    ChatterAdapter.set_headers
    myQuery = ChatterAdapter.root_url + ""
  end

  
  
end
